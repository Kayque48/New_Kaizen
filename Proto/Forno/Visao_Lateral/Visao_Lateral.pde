import ddf.minim.*;
import ddf.minim.ugens.*;
import controlP5.*;

// ─── ÁUDIO ───────────────────────────────────────────────
Minim minim;
AudioOutput audioOut;
Oscil osc1, osc2, osc3, osc4, lfo;
Gain gainMaster;
boolean audioOn = false;

// ─── CONTROLP5 ───────────────────────────────────────────
ControlP5 cp5;
float sliderParticleRate = 9;
float sliderGapTime      = 12;
float sliderBuzzTime     = 10;
float sliderHornRange    = 0.18;

// ─── PRESSÃO ─────────────────────────────────────────────
final float P_OP_GAUGE    = 350.0;   // mBar — operação normal
final float P_CHAPA_GAUGE = 700.0;   // mBar — chapa de explosão (limite destrutivo)
final float P_AMB_ABS     = 1000.0;  // mBar absoluto — pressão ambiente
final float P_CANAL_ABS   = 1350.0;  // mBar absoluto — pressão do canal em operação
final float Q_HORN        = 1.2;     // m³/min por buzina (referência industrial 150dB)
final float T_PULSO       = 10.0;    // segundos de pulso
final float V_TOTAL       = 121.86;  // m³ — volume total do canal (2 cubas)
final float P_ACUST_1     = 6.3246;  // mBar — pressão acústica de 1 buzina a 150dB

// ─── CICLO ───────────────────────────────────────────────
final int FPS_SIM = 60;
int gapFrames()  { return round(sliderGapTime  * FPS_SIM); }
int buzzFrames() { return round(sliderBuzzTime * FPS_SIM); }

boolean running    = false;
String  phase      = "idle";
int     phaseFrame = 0;
int     fr         = 0;
int     activeHorn = 0;
float   crustPct   = 0;
float   gaugeCurrentP = P_OP_GAUGE;

// ─── PARTÍCULAS ──────────────────────────────────────────
final int MAX_PARTS = 500;
float[]   px, py, pvx, pvy, prr, pdrift;
int[]     page;
boolean[] pAlive, pFalling;
int partCount = 0;

// ─── INCRUSTAÇÃO ─────────────────────────────────────────
final int MAX_CRUST = 1000;
float[]  cx_c, cy_c, cs_c, cw_c;
String[] csurf_c;
int crustCount = 0;

// ─── ONDAS ───────────────────────────────────────────────
final int MAX_WAVES = 60;
float[] wx_w, wy_w, wr_w, wa_w;
int waveCount = 0;

// ─── PRESSÃO ─────────────────────────────────────────────
float calcTargetP() {
  if (!running || phase.equals("gap")) return P_OP_GAUGE;
  float vLivre = (Q_HORN / 60.0) * T_PULSO * 1;
  float vEquiv = vLivre * (P_AMB_ABS / P_CANAL_ABS);
  float dP_est = (vEquiv / V_TOTAL) * P_CANAL_ABS;
  float dP_ac  = P_ACUST_1 * 1.0;
  return P_OP_GAUGE + dP_est + dP_ac;
}

// ─── GEOMETRIA ───────────────────────────────────────────
//
//  ___________________________________________________
// |  [1]  |###PAREDE###|  [2]    [3]  |###PAREDE###|  [4]  |
// |   |   |############|              |############|   |   |
// |   |   +------------+              +------------+   |   |
// |   |                                                |   |
// |    \                                              /    |
// |     \              ________                      /     |
// |      \            /        \                    /      |
// |       \__________/          \__________________/       |
//
// Proporções reais:
// Tampa individual = 200mm  → parede interna simples
// Tampa par central = 600mm (2x200 + gap 200) → parede interna dupla
// Zonas [1], [2-3], [4] uniformes
// Base: elevação central aponta pra CIMA

float gRY, gRB;        // topo e fundo da laje
float gExtL, gExtR;    // parede externa topo
float gVertBot;        // onde parede externa para de ser vertical
float gDiagBot;        // base das diagonais (fundo do canal)
float gDiagL, gDiagR;  // X das diagonais no fundo

// Paredes internas
float wallLx1, wallLx2; // parede esq: x esq e x dir
float wallRx1, wallRx2; // parede dir: x esq e x dir
float gWallBot;          // Y onde param as paredes internas

// Base: elevação central aponta pra CIMA
// Pontos: (gDiagL,gDiagBot) -> (__,gDiagBot) -> (peakL,peakY) -> (peakR,peakY) -> (__,gDiagBot) -> (gDiagR,gDiagBot)
float baseFlatL;   // onde começa a rampa esquerda da elevação
float basePeakL;   // topo esquerdo da elevação
float basePeakR;   // topo direito da elevação
float baseFlatR;   // onde termina a rampa direita
float basePeakY;   // Y do topo da elevação (menor Y = mais alto)

// Pokendors
final int N_POKES = 4;
float[] POKE_X;
float   POKE_W;

final int PANEL_H = 160;
int simH() { return height - PANEL_H; }

boolean btnStartHover = false;
boolean btnRHover     = false;

// ─────────────────────────────────────────────────────────
void setup() {
  size(1200, 820);
  frameRate(FPS_SIM);
  smooth(2);
  initArrays();
  calcGeo();
  initAudio();
  initUI();
}

void initArrays() {
  px=new float[MAX_PARTS]; py=new float[MAX_PARTS];
  pvx=new float[MAX_PARTS]; pvy=new float[MAX_PARTS];
  prr=new float[MAX_PARTS]; pdrift=new float[MAX_PARTS];
  page=new int[MAX_PARTS];
  pAlive=new boolean[MAX_PARTS]; pFalling=new boolean[MAX_PARTS];
  cx_c=new float[MAX_CRUST]; cy_c=new float[MAX_CRUST];
  cs_c=new float[MAX_CRUST]; cw_c=new float[MAX_CRUST];
  csurf_c=new String[MAX_CRUST];
  wx_w=new float[MAX_WAVES]; wy_w=new float[MAX_WAVES];
  wr_w=new float[MAX_WAVES]; wa_w=new float[MAX_WAVES];
  POKE_X=new float[N_POKES];
}

void calcGeo() {
  int sh = simH();

  gRY = sh * 0.04;
  gRB = sh * 0.20;

  // Parede externa
  float mg    = width * 0.05;
  gExtL       = mg;
  gExtR       = width - mg;
  gVertBot    = sh * 0.50;
  gDiagBot    = sh * 0.82;
  float inset = width * 0.09;
  gDiagL      = gExtL + inset;
  gDiagR      = gExtR - inset;

  // Proporções baseadas no desenho técnico
  // Canal total = gExtR - gExtL
  // Dividido em 5 partes iguais:
  // [1]=1 parte | PAREDE=1 parte | [2-3]=1 parte | PAREDE=1 parte | [4]=1 parte
  // Tampa individual = 200mm, par central = 600mm (3x tampa)
  // Então: zona lateral = 1 unidade, parede = 1 unidade, zona central = 2 unidades, parede = 1 unidade
  // Total = 1+1+2+1+1 = 6 unidades
  float totalW = gExtR - gExtL;
  float unit   = totalW / 7.0; // 1(zona)+1.5(parede)+2(central)+1.5(parede)+1(zona)

  // Parede interna esquerda: 1.5 unidades de largura
  wallLx1 = gExtL + unit * 1.0;
  wallLx2 = gExtL + unit * 2.0;

  // Parede interna direita: espelho
  wallRx1 = gExtR - unit * 2.0;
  wallRx2 = gExtR - unit * 1.0;

  gWallBot = sh * 0.48;

  // Pokendors
  POKE_W = unit * 0.45;
  POKE_X[0] = gExtL + unit * 0.50;            // zona esquerda
  POKE_X[1] = wallLx2 + (wallRx1-wallLx2)*0.28; // central esquerdo
  POKE_X[2] = wallLx2 + (wallRx1-wallLx2)*0.72; // central direito
  POKE_X[3] = gExtR - unit * 0.50;            // zona direita

  // Base: elevação central aponta PARA CIMA
  // Alinhada com o centro do canal, entre [2] e [3]
  float centerX = width / 2.0;
  float peakW   = (wallRx1 - wallLx2) * 0.55;  // largura do topo da elevação
  basePeakL = centerX - peakW / 2.0;
  basePeakR = centerX + peakW / 2.0;
  basePeakY = gDiagBot - (gDiagBot - gVertBot) * 0.55; // alto — elevação pronunciada

  // Pés das rampas (no nível gDiagBot)
  float rampW = (wallRx1 - wallLx2) * 0.20;
  baseFlatL = basePeakL - rampW;
  baseFlatR = basePeakR + rampW;
}

// ─── GEOMETRIA helpers ────────────────────────────────────
float extLeftX(float y) {
  if (y <= gVertBot) return gExtL;
  float t = constrain((y-gVertBot)/(gDiagBot-gVertBot),0,1);
  return gExtL + (gDiagL-gExtL)*t;
}
float extRightX(float y) {
  if (y <= gVertBot) return gExtR;
  float t = constrain((y-gVertBot)/(gDiagBot-gVertBot),0,1);
  return gExtR + (gDiagR-gExtR)*t;
}

// Y do "teto" da elevação em função de x
// Elevação aponta pra CIMA — retorna o Y máximo permitido (chão)
// Abaixo desta linha = sólido (elevação)
float baseFloorY(float x) {
  // Fora da elevação — fundo plano
  if (x < baseFlatL || x > baseFlatR) return gDiagBot;
  // Rampa esquerda subindo
  if (x < basePeakL) {
    float t = (x - baseFlatL) / (basePeakL - baseFlatL);
    return gDiagBot - (gDiagBot - basePeakY) * t;
  }
  // Topo plano
  if (x <= basePeakR) return basePeakY;
  // Rampa direita descendo
  float t = (x - basePeakR) / (baseFlatR - basePeakR);
  return basePeakY + (gDiagBot - basePeakY) * t;
}

boolean inCanal(float x, float y) {
  if (y < gRB + 2) return false;
  if (x < extLeftX(y) + 2 || x > extRightX(y) - 2) return false;
  if (y < gWallBot) {
    if (x >= wallLx1 && x <= wallLx2) return false;
    if (x >= wallRx1 && x <= wallRx2) return false;
  }
  if (y > baseFloorY(x)) return false;
  return true;
}

boolean nearActiveHorn(float x) {
  float totalW = gExtR - gExtL;
  return abs(x - POKE_X[activeHorn]) < totalW * sliderHornRange;
}

// ─── ÁUDIO ───────────────────────────────────────────────
void initAudio() {
  minim=new Minim(this); audioOut=minim.getLineOut();
  gainMaster=new Gain(-60);
  osc1=new Oscil(118,0.6,Waves.SAW); osc2=new Oscil(240,0.25,Waves.SINE);
  osc3=new Oscil(362,0.15,Waves.SINE); osc4=new Oscil(55,0.20,Waves.SAW);
  lfo=new Oscil(4,6,Waves.SINE);
  lfo.patch(osc3.frequency);
  gainMaster.patch(audioOut);
  osc1.patch(gainMaster); osc2.patch(gainMaster);
  osc3.patch(gainMaster); osc4.patch(gainMaster);
}
void startBuzzSound(){ if(!audioOn){ audioOn=true;  gainMaster.setValue(-6);  } }
void stopBuzzSound() { if(audioOn) { audioOn=false; gainMaster.setValue(-60); } }

// ─── UI ──────────────────────────────────────────────────
void initUI() {
  cp5=new ControlP5(this);
  int panelY=simH(), sw=210, sh2=16, mg=28;
  int sp=(width-mg*2-sw*4)/3;
  int[] cols={mg,mg+sw+sp,mg+(sw+sp)*2,mg+(sw+sp)*3};
  int sliderY=panelY+105;
  cp5.addSlider("sliderParticleRate").setPosition(cols[0],sliderY).setSize(sw,sh2).setRange(3,30).setValue(9).setLabel("").setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  cp5.addSlider("sliderGapTime").setPosition(cols[1],sliderY).setSize(sw,sh2).setRange(4,40).setValue(12).setLabel("").setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  cp5.addSlider("sliderBuzzTime").setPosition(cols[2],sliderY).setSize(sw,sh2).setRange(3,20).setValue(10).setLabel("").setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  cp5.addSlider("sliderHornRange").setPosition(cols[3],sliderY).setSize(sw,sh2).setRange(0.05,0.40).setValue(0.18).setLabel("").setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
}

// ─── SPAWN ───────────────────────────────────────────────
void spawnPart() {
  if (partCount>=MAX_PARTS) return;
  for (int a=0;a<80;a++) {
    // Spawn por toda a altura do canal (inclusive zona diagonal inferior)
    float x=gExtL+15+random(gExtR-gExtL-30);
    float y=gRB+8+random(gDiagBot-gRB-20);
    if (inCanal(x,y)) {
      px[partCount]=x; py[partCount]=y;
      // Velocidade lateral forte para alcançar as paredes; vertical mista
      pvx[partCount]=random(-1.2,1.2);
      pvy[partCount]=random(-0.5,0.5);
      prr[partCount]=random(1.5,3.5);
      // Drift forte para espalhar pelas paredes
      pdrift[partCount]=random(-0.12,0.12);
      page[partCount]=0; pAlive[partCount]=true; pFalling[partCount]=false;
      partCount++; return;
    }
  }
}

void spawnFallingPart(float x, float y) {
  if (partCount>=MAX_PARTS) return;
  px[partCount]=x; py[partCount]=y;
  pvx[partCount]=random(-1.5,1.5);
  pvy[partCount]=random(1.0,3.5);
  prr[partCount]=random(2.0,5.0);
  pdrift[partCount]=0; page[partCount]=0;
  pAlive[partCount]=true; pFalling[partCount]=true;
  partCount++;
}

void spawnWave(float x) {
  if (waveCount>=MAX_WAVES) return;
  wx_w[waveCount]=x; wy_w[waveCount]=gRB+6;
  wr_w[waveCount]=0; wa_w[waveCount]=0.75;
  waveCount++;
}

void addCrust(float x, float y, String surf) {
  int kx=round(x/10), ky=round(y/10);
  for (int i=0;i<crustCount;i++) {
    if (round(cx_c[i]/10)==kx&&round(cy_c[i]/10)==ky&&csurf_c[i].equals(surf)) {
      cs_c[i]=min(cs_c[i]+2,14); recalcCrust(); return;
    }
  }
  if (crustCount>=MAX_CRUST) return;
  cx_c[crustCount]=x; cy_c[crustCount]=y;
  cs_c[crustCount]=4; cw_c[crustCount]=12+random(10);
  csurf_c[crustCount]=surf;
  crustCount++; recalcCrust();
}

void recalcCrust() {
  float t=0;
  for (int i=0;i<crustCount;i++) t+=cs_c[i];
  crustPct=min(100,t/(14*120)*100);
}

// ─── DRAW ────────────────────────────────────────────────
void draw() {
  calcGeo();
  fr++;

  if (running) {
    phaseFrame++;
    if (phase.equals("gap")) {
      if (phaseFrame>=gapFrames()) { phase="buzz"; phaseFrame=0; startBuzzSound(); }
    } else if (phase.equals("buzz")) {
      if (phaseFrame>=buzzFrames()) {
        stopBuzzSound();
        activeHorn=(activeHorn+1)%N_POKES;
        phase="gap"; phaseFrame=0;
      }
    }
    if (fr%round(sliderParticleRate)==0) spawnPart();
    if (phase.equals("buzz")&&fr%20==0) spawnWave(POKE_X[activeHorn]);
  }

  for (int i=waveCount-1;i>=0;i--) {
    wr_w[i]+=4; wa_w[i]-=0.016;
    if (wa_w[i]<=0) removeWave(i);
  }

  boolean buzzing=phase.equals("buzz")&&running;

  if (buzzing&&crustCount>0&&fr%3==0) {
    float hornX=POKE_X[activeHorn];
    float range=(gExtR-gExtL)*sliderHornRange;
    for (int i=0;i<crustCount;i++) {
      if (abs(cx_c[i]-hornX)<range) {
        // Vibração remove crosta rapidamente — toda partícula soltada cai e desaparece
        if (cs_c[i]>0&&random(1)<0.35) {
          spawnFallingPart(cx_c[i],cy_c[i]);
          cs_c[i]=max(0,cs_c[i]-1.5);
        }
      }
    }
    compactCrust(); recalcCrust();
  }

  for (int i=partCount-1;i>=0;i--) {
    if (!pAlive[i]) continue;
    page[i]++;

    // ── Partículas caindo (crosta solta pela vibração) ──────
    if (pFalling[i]) {
      pvx[i]*=0.96; pvy[i]+=0.18;
      px[i]+=pvx[i]; py[i]+=pvy[i];
      // Desaparecem rapidamente — não acumulam no chão
      if (py[i]>gDiagBot || page[i]>90) pAlive[i]=false;
      continue;
    }

    // ── Partículas suspensas ─────────────────────────────────
    boolean local=buzzing&&nearActiveHorn(px[i]);
    if (local) {
      float hornX=POKE_X[activeHorn];
      float dx=px[i]-hornX, dy=py[i]-gRB;
      float d=sqrt(dx*dx+dy*dy)+1;
      float f=90/(d*d);
      pvx[i]+=f*dx/d+random(-1.0,1.0);
      pvy[i]+=f*dy/d+random(-1.0,1.0);
      pvx[i]*=0.84; pvy[i]*=0.84;
    } else {
      // Flutuação neutra: drift lateral para alcançar as paredes
      pvx[i]+=pdrift[i];
      // Leve gravidade para que partículas desçam até as paredes inclinadas
      pvy[i]+=0.012;
      pvx[i]*=0.978; pvy[i]*=0.975;
    }
    px[i]+=pvx[i]; py[i]+=pvy[i];

    // Teto
    if (py[i]<gRB+prr[i]) {
      if (!local) { addCrust(px[i],gRB,"roof"); pAlive[i]=false; continue; }
      py[i]=gRB+prr[i]; pvy[i]*=-0.4;
    }

    // Paredes externas — inclui toda a seção diagonal inferior
    float elx=extLeftX(py[i]);
    if (px[i]<elx+prr[i]) {
      if (!local) { addCrust(elx,py[i],"extL"); pAlive[i]=false; continue; }
      px[i]=elx+prr[i]; pvx[i]=abs(pvx[i])*0.5;
    }
    float erx=extRightX(py[i]);
    if (px[i]>erx-prr[i]) {
      if (!local) { addCrust(erx,py[i],"extR"); pAlive[i]=false; continue; }
      px[i]=erx-prr[i]; pvx[i]=-abs(pvx[i])*0.5;
    }

    // Paredes internas (zona acima de gWallBot)
    if (py[i]<gWallBot) {
      if (px[i]>wallLx1-prr[i]&&px[i]<wallLx2+prr[i]) {
        if (!local) { addCrust(px[i]<(wallLx1+wallLx2)/2?wallLx1:wallLx2,py[i],"wallL"); pAlive[i]=false; continue; }
        pvx[i]*=-0.6; px[i]+=pvx[i]*3;
      }
      if (px[i]>wallRx1-prr[i]&&px[i]<wallRx2+prr[i]) {
        if (!local) { addCrust(px[i]<(wallRx1+wallRx2)/2?wallRx1:wallRx2,py[i],"wallR"); pAlive[i]=false; continue; }
        pvx[i]*=-0.6; px[i]+=pvx[i]*3;
      }
    }

    // Morreu fora do canal ou viveu tempo demais
    if (!inCanal(px[i],py[i])) { pAlive[i]=false; continue; }
    if (local&&page[i]>160) pAlive[i]=false;
  }
  compactParts();

  gaugeCurrentP += (calcTargetP() - gaugeCurrentP) * 0.06;

  background(185,182,178);
  drawZoneHighlight();
  drawStructure();
  drawCrust();
  drawWaves();
  drawParts();
  drawHorns();
  drawTopBar();
  drawPanel();
}

// ─── ZONA ATIVA ──────────────────────────────────────────
void drawZoneHighlight() {
  if (!phase.equals("buzz")||!running) return;
  float hornX=POKE_X[activeHorn];
  float range=(gExtR-gExtL)*sliderHornRange;
  noStroke(); fill(80,140,255,22);
  rect(hornX-range,gRB,range*2,gVertBot-gRB);
  stroke(80,140,255,75); strokeWeight(1.5);
  line(hornX-range,gRB,hornX-range,gVertBot);
  line(hornX+range,gRB,hornX+range,gVertBot);
  noStroke();
}

// ─── ESTRUTURA ───────────────────────────────────────────
void drawStructure() {
  int wallGray  = 118;
  int innerGray = 150;
  int canalDark = 28;

  // Laje teto
  fill(wallGray); noStroke();
  rect(0,gRY,width,gRB-gRY);
  fill(innerGray);
  rect(gExtL,gRB-4,gExtR-gExtL,5);

  // Estrutura externa esquerda
  fill(wallGray); noStroke();
  beginShape();
  vertex(0,gRY); vertex(gExtL,gRY);
  vertex(gExtL,gVertBot); vertex(gDiagL,gDiagBot);
  vertex(0,gDiagBot);
  endShape(CLOSE);

  // Estrutura externa direita
  beginShape();
  vertex(gExtR,gRY); vertex(width,gRY);
  vertex(width,gDiagBot); vertex(gDiagR,gDiagBot);
  vertex(gExtR,gVertBot);
  endShape(CLOSE);

  // Abaixo das diagonais
  fill(wallGray); rect(0,gDiagBot,width,simH()-gDiagBot);

  // Elevação central (sólido cinza, aponta pra CIMA)
  fill(wallGray); noStroke();
  beginShape();
  vertex(gDiagL,gDiagBot);
  vertex(baseFlatL,gDiagBot);
  vertex(basePeakL,basePeakY);
  vertex(basePeakR,basePeakY);
  vertex(baseFlatR,gDiagBot);
  vertex(gDiagR,gDiagBot);
  vertex(gDiagR,gDiagBot+30);
  vertex(gDiagL,gDiagBot+30);
  endShape(CLOSE);

  // Interior do canal — um único polígono contíguo, sem triângulos cruzados
  fill(canalDark); noStroke();
  beginShape();
  vertex(gExtL,  gRB);
  vertex(gExtR,  gRB);
  vertex(gExtR,  gVertBot);
  vertex(gDiagR, gDiagBot);
  vertex(baseFlatR, gDiagBot);
  vertex(basePeakR, basePeakY);
  vertex(basePeakL, basePeakY);
  vertex(baseFlatL, gDiagBot);
  vertex(gDiagL, gDiagBot);
  vertex(gExtL,  gVertBot);
  endShape(CLOSE);

  // Paredes internas sólidas (cobrem a área acima de gWallBot)
  fill(wallGray); noStroke();
  rect(wallLx1,gRY,wallLx2-wallLx1,gWallBot-gRY);
  rect(wallRx1,gRY,wallRx2-wallRx1,gWallBot-gRY);

  // Faces internas (linhas de destaque)
  stroke(innerGray); strokeWeight(2.5);
  // Parede externa
  line(gExtL,gRB,gExtL,gVertBot);
  line(gExtL,gVertBot,gDiagL,gDiagBot);
  line(gExtR,gRB,gExtR,gVertBot);
  line(gExtR,gVertBot,gDiagR,gDiagBot);
  // Paredes internas
  line(wallLx1,gRB,wallLx1,gWallBot);
  line(wallLx2,gRB,wallLx2,gWallBot);
  line(wallRx1,gRB,wallRx1,gWallBot);
  line(wallRx2,gRB,wallRx2,gWallBot);
  // Elevação
  line(gDiagL,gDiagBot,baseFlatL,gDiagBot);
  line(baseFlatL,gDiagBot,basePeakL,basePeakY);
  line(basePeakL,basePeakY,basePeakR,basePeakY);
  line(basePeakR,basePeakY,baseFlatR,gDiagBot);
  line(baseFlatR,gDiagBot,gDiagR,gDiagBot);
  noStroke();

  // Labels
  fill(160); textSize(11); textAlign(CENTER,TOP);
  text("1100°C",(gExtL+wallLx1)/2, gRB+10);
  text("1100°C",(wallLx2+wallRx1)/2, gRB+10);
  text("1100°C",(wallRx2+gExtR)/2, gRB+10);
  fill(150); textAlign(CENTER,CENTER);
  text("passagem\ncentral",(basePeakL+basePeakR)/2, basePeakY+(gDiagBot-basePeakY)*0.4);
}

// ─── POKENDORS ───────────────────────────────────────────
void drawHorns() {
  boolean buzzing=phase.equals("buzz")&&running;
  float pw=POKE_W;

  // Tampa compartilhada [1] e [2]
  float tampX=POKE_X[1]-pw/2-5;
  float tampW=(POKE_X[2]+pw/2+5)-tampX;
  fill(105); noStroke(); rect(tampX,gRY+2,tampW,7,3);
  fill(70); textSize(9); textAlign(CENTER,BOTTOM);
  text("tampa compartilhada",(POKE_X[1]+POKE_X[2])/2,gRY+1);

  for (int i=0;i<N_POKES;i++) {
    float ppx=POKE_X[i];
    boolean isActive=buzzing&&(i==activeHorn);
    boolean wasDone=running&&(i<activeHorn);

    if (i==0||i==3) {
      fill(100); noStroke(); rect(ppx-pw/2-4,gRY,pw+8,6,2);
      fill(70); textSize(9); textAlign(CENTER,BOTTOM);
      text("tampa",ppx,gRY-1);
    }

    fill(isActive?65:(wasDone?85:108)); noStroke();
    rect(ppx-pw/2,gRY,pw,gRB-gRY,2);
    fill(isActive?28:18); noStroke();
    rect(ppx-pw/2+3,gRY+4,pw-6,gRB-gRY-8);
    fill(isActive?60:42); noStroke();
    rect(ppx-pw/2,gRB-5,pw,6);

    if (isActive) {
      fill(240,200,0); noStroke(); ellipse(ppx,gRY+8,9,9);
      fill(50); textSize(10); textAlign(CENTER,BOTTOM);
      text("ATIVA",ppx,gRY-13);
    }
    fill(isActive?255:180); textSize(10); textAlign(CENTER,CENTER);
    text(str(i+1),ppx,gRY+(gRB-gRY)*0.55);
  }
}

// ─── CRUST ───────────────────────────────────────────────
void drawCrust() {
  for (int i=0;i<crustCount;i++) {
    float s=cs_c[i],w=cw_c[i],x=cx_c[i],y=cy_c[i];
    noStroke(); fill(100,60,20);
    String surf=csurf_c[i];
    if (surf.equals("roof")) {
      rect(x-w/2,y,w,s); fill(140,80,30); rect(x-w/2,y+s-2,w,2);
    } else if (surf.equals("extL")||surf.equals("wallL")) {
      rect(x,y-w/2,s,w); fill(140,80,30); rect(x+s-2,y-w/2,2,w);
    } else if (surf.equals("extR")||surf.equals("wallR")) {
      rect(x-s,y-w/2,s,w); fill(140,80,30); rect(x-s,y-w/2,2,w);
    } else {
      rect(x-w/2,y-s,w,s); fill(140,80,30); rect(x-w/2,y-s,w,2);
    }
  }
}

void drawWaves() {
  noFill();
  for (int i=0;i<waveCount;i++) {
    stroke(160,200,255,wa_w[i]*200); strokeWeight(2);
    ellipse(wx_w[i],wy_w[i],wr_w[i]*2,wr_w[i]*2);
  }
  noStroke();
}

void drawParts() {
  boolean buzzing=phase.equals("buzz")&&running;
  noStroke();
  for (int i=0;i<partCount;i++) {
    if (!pAlive[i]) continue;
    float a=min(1,page[i]/18.0);
    float r=prr[i];

    if (pFalling[i]) {
      // Fade out rápido conforme cai (desaparece sem acumular)
      float fadeA=map(page[i],0,90,220,0);
      float speed=sqrt(pvx[i]*pvx[i]+pvy[i]*pvy[i]);
      float bright=map(speed,0,5,140,210);
      fill(bright,bright*0.7,bright*0.4,fadeA);
      ellipse(px[i],py[i],r*2,r*2);
    } else {
      boolean local=buzzing&&nearActiveHorn(px[i]);
      // Cor varia por altitude — mais brilhante perto do teto (pó mais fresco)
      float yRatio=constrain((py[i]-gRB)/(gVertBot-gRB),0,1);
      float br=lerp(205,160,yRatio);

      if (local) {
        // Halo difuso na zona ativa
        fill(240,220,160,a*55);
        ellipse(px[i],py[i],r*4,r*4);
        fill(230,210,150,a*220);
      } else {
        fill(br,br*0.84,br*0.58,a*195);
      }
      ellipse(px[i],py[i],r*2,r*2);
    }
  }
}

// ─── BARRA SUPERIOR ──────────────────────────────────────
void drawTopBar() {
  fill(210); noStroke(); rect(0,0,width,gRY-2);
  float bx=14,by=6,bw=170,bh=22;
  if (running) fill(80,0,0); else fill(btnStartHover?190:210);
  stroke(125); strokeWeight(0.5); rect(bx,by,bw,bh,5);
  fill(running?255:30); noStroke(); textSize(12); textAlign(CENTER,CENTER);
  text(running?"■  Parar":"▶  Iniciar ciclo",bx+bw/2,by+bh/2);

  float rx2=bx+bw+8;
  fill(btnRHover?190:210); stroke(125); strokeWeight(0.5); rect(rx2,by,95,bh,5);
  fill(30); noStroke(); textAlign(CENTER,CENTER); textSize(12);
  text("↺  Reiniciar",rx2+47,by+bh/2);

  String bTxt; color bBg,bFg;
  if (!running)                  { bTxt="Aguardando início"; bBg=color(238,230,230); bFg=color(100,0,0); }
  else if (phase.equals("buzz")) { bTxt="BUZINA "+str(activeHorn+1)+" ATIVA — limpeza localizada"; bBg=color(220,232,224); bFg=color(30,100,60); }
  else                           { bTxt="Acumulando — aguardando próxima buzina"; bBg=color(238,233,218); bFg=color(120,80,20); }
  float bX=rx2+103; textSize(12);
  fill(bBg); stroke(bFg); strokeWeight(0.5); rect(bX,by,textWidth(bTxt)+18,bh,5);
  fill(bFg); noStroke(); textAlign(LEFT,CENTER); text(bTxt,bX+9,by+bh/2);

  if (running) {
    String tt;
    if (phase.equals("gap")) { int ml=max(0,round((gapFrames()-phaseFrame)/(float)gapFrames()*3)); tt="próxima: ~"+ml+" min (simulado)"; }
    else { int sl=max(0,round((buzzFrames()-phaseFrame)/(float)FPS_SIM)); tt="buzina "+str(activeHorn+1)+": "+sl+"s"; }
    fill(80); textSize(11); textAlign(RIGHT,CENTER); text(tt,width-12,by+bh/2);
  }

  float barY=gRY-5,barH=4;
  fill(180); noStroke(); rect(0,barY,width,barH,2);
  float pct=0;
  if (running) pct=phase.equals("gap")?(float)phaseFrame/gapFrames():(float)phaseFrame/buzzFrames();
  fill(phase.equals("buzz")?color(60,110,80):color(120,90,30));
  rect(0,barY,width*pct,barH,2);
}

// ─── PAINEL ──────────────────────────────────────────────
void drawPanel() {
  int py2=simH();
  fill(205); stroke(180); strokeWeight(1); rect(0,py2,width,PANEL_H);
  fill(60); textSize(13); textAlign(LEFT,TOP); text("Configurações",14,py2+8);

  int sx=14,sy=py2+28;
  drawStatBox(sx,     sy,170,"Fase",       running?(phase.equals("buzz")?"Buzina "+str(activeHorn+1)+" ativa":"Acumulando"):"Parado");
  drawStatBox(sx+180, sy,130,"Partículas", str(countAlive()));
  drawStatBox(sx+320, sy,130,"Incrustação",nf(crustPct,0,0)+"%");
  drawStatBox(sx+460, sy,130,"Canal",      canalStatus());
  float pctMargem = constrain((gaugeCurrentP - P_OP_GAUGE) / (P_CHAPA_GAUGE - P_OP_GAUGE) * 100, 0, 100);
  drawStatBox(sx + 600, sy, 150, "Δ Pressão", nf(gaugeCurrentP - P_OP_GAUGE, 0, 1) + " mBar (" + nf(pctMargem,0,1) + "%)");

  drawPressureGauge(width - 58, simH() + 8, 50, PANEL_H - 16);

  // Legenda — linha horizontal abaixo dos sliders (slider+valores terminam em py2+121)
  int lly = py2 + 140;
  drawLegendDot(14,  lly, color(185,155,105), "Pó de cal");
  drawLegendDot(214, lly, color(220,200,140), "Zona ativa");
  drawLegendDot(414, lly, color(170,120,70),  "Caindo");
  drawLegendDot(614, lly, color(100,60,20),   "Incrustação");
  drawLegendDot(814, lly, color(160,200,255), "Onda acústica");

  int sw=210,mg=28,sp=(width-mg*2-sw*4)/3;
  int[] cols={mg,mg+sw+sp,mg+(sw+sp)*2,mg+(sw+sp)*3};
  int labelY=py2+78,sliderY=py2+105;
  String[] names={"Taxa de poeira","Intervalo entre buzinas","Duração da buzina","Raio de influência"};
  String[] descs={"frames/spawn — menor = mais pó","segundos reais (~3 min simulados)","segundos que a buzina fica ligada","fração do canal coberta pelo som"};
  String[] vals={nf(sliderParticleRate,0,1)+" fr",nf(sliderGapTime,0,1)+" s",nf(sliderBuzzTime,0,1)+" s",nf(sliderHornRange*100,0,0)+"%"};
  for (int i=0;i<4;i++) {
    fill(40); textSize(12); textAlign(LEFT,BOTTOM); text(names[i],cols[i],labelY);
    fill(100); textSize(10); textAlign(LEFT,TOP);   text(descs[i],cols[i],labelY+2);
    fill(40); textSize(11); textAlign(LEFT,CENTER); text(vals[i],cols[i]+sw+8,sliderY+8);
  }
}

void drawStatBox(float x,float y,float w,String label,String val) {
  fill(192); stroke(170); strokeWeight(0.5); rect(x,y,w,32,5);
  fill(90); noStroke(); textSize(10); textAlign(LEFT,TOP); text(label,x+7,y+4);
  fill(20); textSize(14); textAlign(LEFT,BOTTOM); text(val,x+7,y+30);
}
void drawLegendDot(float x,float y,color c,String label) {
  fill(c); noStroke(); ellipse(x+5,y,10,10);
  fill(60); textSize(11); textAlign(LEFT,CENTER); text(label,x+16,y);
}
String canalStatus() { if (crustPct<5) return "Limpo"; if (crustPct<50) return "Acumulando"; return "Obstruído!"; }
int countAlive() { int n=0; for (int i=0;i<partCount;i++) if (pAlive[i]&&!pFalling[i]) n++; return n; }

void compactParts() {
  int w=0;
  for (int i=0;i<partCount;i++) {
    if (pAlive[i]) {
      px[w]=px[i]; py[w]=py[i]; pvx[w]=pvx[i]; pvy[w]=pvy[i];
      prr[w]=prr[i]; pdrift[w]=pdrift[i]; page[w]=page[i];
      pAlive[w]=true; pFalling[w]=pFalling[i]; w++;
    }
  }
  partCount=w;
}
void compactCrust() {
  int w=0;
  for (int i=0;i<crustCount;i++) {
    if (cs_c[i]>0) { cx_c[w]=cx_c[i]; cy_c[w]=cy_c[i]; cs_c[w]=cs_c[i]; cw_c[w]=cw_c[i]; csurf_c[w]=csurf_c[i]; w++; }
  }
  crustCount=w;
}
void removeWave(int i) {
  for (int j=i;j<waveCount-1;j++) { wx_w[j]=wx_w[j+1]; wy_w[j]=wy_w[j+1]; wr_w[j]=wr_w[j+1]; wa_w[j]=wa_w[j+1]; }
  waveCount--;
}

// ─── GAUGE DE PRESSÃO ────────────────────────────────────
void drawPressureGauge(float x, float y, float w, float h) {
  fill(185); stroke(160); strokeWeight(0.8);
  rect(x, y, w, h, 4);

  float pct  = constrain((gaugeCurrentP - 0) / P_CHAPA_GAUGE, 0, 1);
  float barH = (h - 20) * pct;
  float barY = y + h - 10 - barH;

  color barCol;
  if      (gaugeCurrentP < 400) barCol = color(60, 160, 80);
  else if (gaugeCurrentP < 600) barCol = color(200, 160, 20);
  else                           barCol = color(180, 40, 40);

  noStroke(); fill(barCol);
  rect(x + 6, barY, w - 12, barH, 2);

  float yOp    = y + h - 10 - (h - 20) * (P_OP_GAUGE    / P_CHAPA_GAUGE);
  float yChapa = y + h - 10 - (h - 20);

  stroke(80, 80, 80, 180); strokeWeight(1);
  drawDashedLine(x + 4, yOp, x + w - 4, yOp, 4);

  stroke(180, 40, 40, 220); strokeWeight(1.2);
  drawDashedLine(x + 4, yChapa, x + w - 4, yChapa, 4);

  fill(20); noStroke(); textSize(11); textAlign(CENTER, TOP);
  text(nf(gaugeCurrentP, 0, 1) + " mBar", x + w/2, y + h - 10 + 3);

  textSize(9); textAlign(CENTER, TOP); fill(90);
  text("Pressão", x + w/2, y + 3);

  fill(160, 40, 40); textSize(8); textAlign(LEFT, CENTER);
  text("700", x + w - 18, yChapa);

  fill(60); textSize(8); textAlign(LEFT, CENTER);
  text("350", x + w - 18, yOp);
}

void drawDashedLine(float x1, float y1, float x2, float y2, float dash) {
  float d     = dist(x1, y1, x2, y2);
  float steps = d / (dash * 2);
  for (int i = 0; i < steps; i++) {
    float t1 = (i * 2 * dash) / d;
    float t2 = min(((i * 2 + 1) * dash) / d, 1);
    line(lerp(x1, x2, t1), lerp(y1, y2, t1), lerp(x1, x2, t2), lerp(y1, y2, t2));
  }
}

void mouseClicked() {
  if (mouseY>=simH()) return;
  float bx=14,by=6,bw=170,bh=22;
  if (mouseX>=bx&&mouseX<=bx+bw&&mouseY>=by&&mouseY<=by+bh) {
    if (!running) { running=true; phase="gap"; phaseFrame=0; activeHorn=0; }
    else { running=false; stopBuzzSound(); }
  }
  float rx2=bx+bw+8;
  if (mouseX>=rx2&&mouseX<=rx2+95&&mouseY>=by&&mouseY<=by+bh) resetSim();
}
void mouseMoved() {
  float bx=14,by=6,bw=170,bh=22,rx2=bx+bw+8;
  btnStartHover=mouseX>=bx&&mouseX<=bx+bw&&mouseY>=by&&mouseY<=by+bh;
  btnRHover=mouseX>=rx2&&mouseX<=rx2+95&&mouseY>=by&&mouseY<=by+bh;
}
void resetSim() {
  running=false; phase="idle"; phaseFrame=0; activeHorn=0; fr=0;
  partCount=0; crustCount=0; waveCount=0; crustPct=0;
  stopBuzzSound();
}
void stop() {
  if (audioOut!=null) audioOut.close();
  if (minim!=null) minim.stop();
  super.stop();
}
