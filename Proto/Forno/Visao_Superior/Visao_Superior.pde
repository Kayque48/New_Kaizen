import ddf.minim.*;
import ddf.minim.ugens.*;
import controlP5.*;

// ─── ÁUDIO ───────────────────────────────────────────────
Minim minim;
AudioOutput audioOut;
Oscil osc1, osc2, osc3, osc4, lfo;
boolean audioOn = false;

// ─── CONTROLP5 ───────────────────────────────────────────
ControlP5 cp5;
float sliderGapTime  = 8;
float sliderBuzzTime = 5;
float sliderHornMode   = 1;  // 1→48, 2→24, 3→16, 4→8 buzinas
float sliderSimulCount = 1;  // 1, 2 ou 3 buzinas simultâneas

final int[] HORN_STEPS   = {1, 2, 3, 6};
final int[] SIMUL_COUNTS = {1, 2, 4, 6};   // 3 e 5 inválidos; máx 3 por cuba

// ─── SCRIPT DE TRIANGULAÇÃO (4 passos) ───────────────────
// Cada linha é (PA_local, PB_local): posição base em local coords (0..23)
// para Cuba A e Cuba B respectivamente.
//
// Mapeamento visual do forno (anel de 24 posições, 0=topo, 6=direita, 12=baixo, 18=esquerda):
//
//   passo 0:  |>  \/     A na junção direita (6),  B no fundo    (12)
//   passo 1:  /\  <|     A no topo           (0),  B na junção esquerda (18)
//   passo 2:  |>  /\     A na junção direita (6),  B no topo     (0)
//   passo 3:  \/  |>     A no fundo          (12), B na junção direita (6)
//
// Garantia matemática: pokendors 7 (A,local6) e 43 (B,local18) NUNCA estão
// no mesmo passo — quando A=6, B∈{12,0,6} (nunca 18); quando B=18, A=0 (nunca 6). ✓
// Os valores {0,6,12,18} são divisíveis por todos os hornStep (1,2,3,6),
// portanto estão sempre no set participante, qualquer que seja a configuração. ✓
final int[][] SCRIPT = { {6,12}, {0,18}, {6,0}, {12,6} };

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
int hornStep()          { return HORN_STEPS  [constrain(round(sliderHornMode)   - 1, 0, 3)]; }
int numSimul()          { return SIMUL_COUNTS[constrain(round(sliderSimulCount) - 1, 0, 3)]; }
int numParticipating()  { return N_POKES_TOTAL    / hornStep(); }
int numParticipPerRing(){ return N_POKES_PER_RING / hornStep(); }

// ns=1 → ciclo percorre todas as posições participantes (A+B)
// ns≥2 → ciclo tem exatamente 4 passos (script fixo)
int numCycleLen() { return numSimul() == 1 ? numParticipating() : 4; }

// ─── CÁLCULO DAS BUZINAS ATIVAS ──────────────────────────
int[] getActiveHorns() {
  int ns   = numSimul();
  int step = hornStep();
  int npR  = numParticipPerRing();

  if (ns == 1) {
    // Sequencial: primeiras npR posições → Cuba A, seguintes → Cuba B
    if (activeHornIdx < npR) return new int[]{ activeHornIdx * step };
    else                     return new int[]{ N_POKES_PER_RING + (activeHornIdx - npR) * step };
  }

  // ── Script de 4 passos com A e B em ângulos DISTINTOS ────────────────
  // A e B partem de posições diferentes → poke7 e poke43 nunca juntos.
  int[] base    = SCRIPT[activeHornIdx % 4];
  int   PA_idx  = base[0] / step;   // índice participante da base de A (0..npR-1)
  int   PB_idx  = base[1] / step;   // índice participante da base de B

  // ── Triangulação dentro do set participante ───────────────────────────
  // perRing=1 → 1 posição por cuba (ns=2)
  // perRing=2 → 2 posições opostas  por cuba (ns=4), separação 180°
  // perRing=3 → triângulo equilátero por cuba (ns=6), separação 120°
  // Separação mínima garantida mesmo nos piores casos (hornStep=6 → 90°)
  int perRing = ns / 2;
  int sp      = max(1, npR / perRing);  // espaçamento no set participante

  int[] r = new int[ns];
  int   i = 0;
  for (int k = 0; k < perRing; k++) {
    r[i++] =                  ((PA_idx + k * sp) % npR) * step;   // Cuba A
    r[i++] = N_POKES_PER_RING + ((PB_idx + k * sp) % npR) * step; // Cuba B
  }

  // ── Segurança final: poke7 (A,idx6) e poke43 (B,idx42) nunca juntos ─
  // (aciona apenas em configs densas: hornStep≥3 + ns=6)
  if (isActiveHorn(r, 6) && isActiveHorn(r, 42)) {
    for (int j = 0; j < r.length; j++) {
      if (r[j] == 42) {
        // Desloca poke43 para o participante anterior em B, fora do conflito
        r[j] = N_POKES_PER_RING + ((18 / step - 1 + npR) % npR) * step;
        break;
      }
    }
  }
  return r;
}

boolean isParticipating(int i)         { return i % hornStep() == 0; }
boolean isActiveHorn(int[] arr, int v) { for (int x : arr) if (x == v) return true; return false; }
int     primaryHorn()                  { return getActiveHorns()[0]; }

boolean running      = false;
String  phase        = "idle";
int     phaseFrame   = 0;
int     fr           = 0;
int     activeHornIdx = 0;  // índice dentro do set participante
float   gaugeCurrentP = P_OP_GAUGE;

// ─── ONDAS ───────────────────────────────────────────────
final int MAX_WAVES = 80;
float[] wx_w, wy_w, wr_w, wa_w;
int waveCount = 0;

// ─── GEOMETRIA ───────────────────────────────────────────
float R_EXT;     // raio externo (anel laranja)
float R_RING;    // raio do anel azul interno
float R_HOLE;    // raio do buraco interno
float R_POKE;    // raio onde ficam os pokendors
float CY;        // centro Y
float CX1, CX2; // centros X das cubas A e B

final int N_POKES_PER_RING = 24;
final int N_POKES_TOTAL    = N_POKES_PER_RING * 2; // 48

float[] pokeX    = new float[N_POKES_TOTAL];
float[] pokeY    = new float[N_POKES_TOTAL];
boolean[] pokeJunction = new boolean[N_POKES_TOTAL];
// 0 = Cuba A, 1 = Cuba B
int[]   pokeRing = new int[N_POKES_TOTAL];

final int PANEL_H = 170;
int simH() { return height - PANEL_H; }

boolean btnStartHover = false;
boolean btnRHover     = false;

// ─── PRESSÃO ─────────────────────────────────────────────
float calcTargetP() {
  if (!running || phase.equals("gap")) return P_OP_GAUGE;
  int n = numSimul();
  float vLivre = (Q_HORN / 60.0) * T_PULSO * n;
  float vEquiv = vLivre * (P_AMB_ABS / P_CANAL_ABS);
  float dP_est = (vEquiv / V_TOTAL) * P_CANAL_ABS;
  float dP_ac  = P_ACUST_1 * sqrt(n);
  return P_OP_GAUGE + dP_est + dP_ac;
}

// ─── SETUP ───────────────────────────────────────────────
void setup() {
  size(900, 620);
  frameRate(FPS_SIM);
  smooth(4);
  initArrays();
  calcGeo();
  initAudio();
  initUI();
}

void initArrays() {
  wx_w = new float[MAX_WAVES];
  wy_w = new float[MAX_WAVES];
  wr_w = new float[MAX_WAVES];
  wa_w = new float[MAX_WAVES];
}

void calcGeo() {
  int sh = simH();
  R_EXT  = sh * 0.44;
  R_RING = R_EXT - R_EXT * 0.07;
  R_HOLE = R_EXT * 0.52;
  R_POKE = R_EXT * 0.85;
  CY     = sh * 0.50;
  CX1    = width * 0.50 - R_RING;  // encosta pelo anel azul
  CX2    = width * 0.50 + R_RING;

  // Gera posições dos pokendors
  for (int i = 0; i < N_POKES_PER_RING; i++) {
    float a = (i / float(N_POKES_PER_RING)) * TWO_PI - HALF_PI;

    // Cuba A
    pokeX[i]    = CX1 + cos(a) * R_POKE;
    pokeY[i]    = CY  + sin(a) * R_POKE;
    pokeRing[i] = 0;
    // junção: ângulo próximo de 0° (lado direito da cuba A)
    float aDeg = degrees(a % TWO_PI + TWO_PI) % 360;
    pokeJunction[i] = (aDeg > 330 || aDeg < 31);

    // Cuba B (espelho)
    int j = i + N_POKES_PER_RING;
    pokeX[j]    = CX2 + cos(a) * R_POKE;
    pokeY[j]    = CY  + sin(a) * R_POKE;
    pokeRing[j] = 1;
    // junção: ângulo próximo de 180° (lado esquerdo da cuba B)
    pokeJunction[j] = (aDeg > 149 && aDeg < 211);
  }
}

// ─── ÁUDIO ───────────────────────────────────────────────
void initAudio() {
  minim    = new Minim(this);
  audioOut = minim.getLineOut();
  osc1     = new Oscil(118, 0, Waves.SAW);
  osc2     = new Oscil(240, 0, Waves.SINE);
  osc3     = new Oscil(362, 0, Waves.SINE);
  osc4     = new Oscil(55,  0, Waves.SAW);
  lfo      = new Oscil(4, 6, Waves.SINE);
  lfo.patch(osc3.frequency);
  osc1.patch(audioOut);
  osc2.patch(audioOut);
  osc3.patch(audioOut);
  osc4.patch(audioOut);
}

void startBuzzSound() {
  audioOn = true;
  osc1.setAmplitude(0.6);
  osc2.setAmplitude(0.25);
  osc3.setAmplitude(0.15);
  osc4.setAmplitude(0.20);
}
void stopBuzzSound() {
  audioOn = false;
  osc1.setAmplitude(0);
  osc2.setAmplitude(0);
  osc3.setAmplitude(0);
  osc4.setAmplitude(0);
}

// ─── UI ──────────────────────────────────────────────────
void initUI() {
  cp5 = new ControlP5(this);
  int panelY = simH();
  int sw = 200, sh2 = 16, mg = 28;
  int[] cols = { mg, mg + sw + 80 };
  int sliderY1 = panelY + 88;
  int sliderY2 = panelY + 135;

  // Linha 1
  Slider gapSlider = cp5.addSlider("sliderGapTime")
    .setPosition(cols[0], sliderY1).setSize(sw, sh2)
    .setRange(2, 30).setValue(8).setLabel("")
    .setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  gapSlider.getValueLabel().setVisible(false);

  Slider buzzSlider = cp5.addSlider("sliderBuzzTime")
    .setPosition(cols[1], sliderY1).setSize(sw, sh2)
    .setRange(2, 15).setValue(5).setLabel("")
    .setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  buzzSlider.getValueLabel().setVisible(false);

  // Linha 2 — buzinas instaladas (48 / 24 / 16 / 8)
  Slider hornSlider = cp5.addSlider("sliderHornMode")
    .setPosition(cols[0], sliderY2).setSize(sw, sh2)
    .setRange(1, 4).setValue(1).setLabel("")
    .setNumberOfTickMarks(4).snapToTickMarks(true)
    .setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  hornSlider.getTickMarks().get(0).setLabel("48");
  hornSlider.getTickMarks().get(1).setLabel("24");
  hornSlider.getTickMarks().get(2).setLabel("16");
  hornSlider.getTickMarks().get(3).setLabel("8");

  // Linha 2 — simultâneas (1 / 2 / 4 / 6) — sempre pares exceto 1; máx 3 por cuba
  Slider simulSlider = cp5.addSlider("sliderSimulCount")
    .setPosition(cols[1], sliderY2).setSize(sw, sh2)
    .setRange(1, 4).setValue(1).setLabel("")
    .setNumberOfTickMarks(4).snapToTickMarks(true)
    .setColorForeground(color(100)).setColorActive(color(60)).setColorBackground(color(200));
  simulSlider.getTickMarks().get(0).setLabel("1");
  simulSlider.getTickMarks().get(1).setLabel("2");
  simulSlider.getTickMarks().get(2).setLabel("4");
  simulSlider.getTickMarks().get(3).setLabel("6");

  hornSlider.getValueLabel().setVisible(false);
  simulSlider.getValueLabel().setVisible(false);
}

// ─── ONDAS ───────────────────────────────────────────────
void spawnWave(float x, float y) {
  if (waveCount >= MAX_WAVES) return;
  wx_w[waveCount] = x;
  wy_w[waveCount] = y;
  wr_w[waveCount] = 0;
  wa_w[waveCount] = 0.85;
  waveCount++;
}

void removeWave(int i) {
  for (int j = i; j < waveCount - 1; j++) {
    wx_w[j] = wx_w[j+1]; wy_w[j] = wy_w[j+1];
    wr_w[j] = wr_w[j+1]; wa_w[j] = wa_w[j+1];
  }
  waveCount--;
}

// ─── DRAW ────────────────────────────────────────────────
void draw() {
  calcGeo();
  fr++;

  // Ciclo
  if (running) {
    phaseFrame++;
    if (phase.equals("gap")) {
      if (phaseFrame >= gapFrames()) {
        phase = "buzz"; phaseFrame = 0; startBuzzSound();
      }
    } else if (phase.equals("buzz")) {
      if (phaseFrame >= buzzFrames()) {
        stopBuzzSound();
        activeHornIdx = (activeHornIdx + 1) % numCycleLen();
        phase = "gap"; phaseFrame = 0;
      }
      if (fr % 16 == 0) {
        int[] ah = getActiveHorns();
        for (int k = 0; k < ah.length; k++) spawnWave(pokeX[ah[k]], pokeY[ah[k]]);
      }
    }
  }

  // Atualiza ondas
  for (int i = waveCount - 1; i >= 0; i--) {
    wr_w[i] += 5;
    wa_w[i] -= 0.022;
    if (wa_w[i] <= 0) removeWave(i);
  }

  gaugeCurrentP += (calcTargetP() - gaugeCurrentP) * 0.06;

  // ── DESENHO ──────────────────────────────────────────
  background(245, 244, 240);

  drawFornoShape();
  drawWaves();
  drawPokendors();
  drawTopBar();
  drawPanel();
}

// ─── FORMA DO FORNO ──────────────────────────────────────
void drawFornoShape() {
  // Camada laranja externa
  fill(224, 120, 88); noStroke();
  ellipse(CX1, CY, R_EXT * 2, R_EXT * 2);
  ellipse(CX2, CY, R_EXT * 2, R_EXT * 2);

  // Mascara o laranja sobreposto no encosto entre os dois anéis
  float halfGap = R_EXT - R_RING;
  fill(245, 244, 240); noStroke();
  rect(width * 0.5 - halfGap, CY - R_EXT, halfGap * 2, R_EXT * 2);

  // Anel azul
  fill(74, 128, 208); noStroke();
  ellipse(CX1, CY, R_RING * 2, R_RING * 2);
  ellipse(CX2, CY, R_RING * 2, R_RING * 2);

  // Buraco interno (fundo escuro = interior quente do forno)
  fill(30, 28, 22); noStroke();
  ellipse(CX1, CY, R_HOLE * 2, R_HOLE * 2);
  ellipse(CX2, CY, R_HOLE * 2, R_HOLE * 2);

  // Temperatura no interior
  fill(180, 80, 30, 120); noStroke();
  ellipse(CX1, CY, R_HOLE * 1.4, R_HOLE * 1.4);
  ellipse(CX2, CY, R_HOLE * 1.4, R_HOLE * 1.4);

  // Labels das cubas
  fill(200); textSize(14); textAlign(CENTER, CENTER);
  text("cuba A", CX1, CY - 8);
  text("1100°C", CX1, CY + 12);
  text("cuba B", CX2, CY - 8);
  text("1100°C", CX2, CY + 12);
}

// ─── ONDAS ───────────────────────────────────────────────
void drawWaves() {
  noFill();
  for (int i = 0; i < waveCount; i++) {
    stroke(96, 160, 224, wa_w[i] * 220);
    strokeWeight(2);
    ellipse(wx_w[i], wy_w[i], wr_w[i] * 2, wr_w[i] * 2);
  }
  noStroke();
}

// ─── POKENDORS ───────────────────────────────────────────
void drawPokendors() {
  boolean buzzing = phase.equals("buzz") && running;

  int[] activeHorns = buzzing ? getActiveHorns() : new int[0];
  for (int i = 0; i < N_POKES_TOTAL; i++) {
    boolean isActive  = isActiveHorn(activeHorns, i);
    boolean hasBuzina = isParticipating(i);
    float pr = pokeJunction[i] ? 8 : 7;

    if (isActive) {
      // Halo amarelo
      noStroke();
      fill(255, 204, 0, 70);
      ellipse(pokeX[i], pokeY[i], (pr + 8) * 2, (pr + 8) * 2);
      fill(255, 204, 0, 40);
      ellipse(pokeX[i], pokeY[i], (pr + 16) * 2, (pr + 16) * 2);
    }

    // Círculo do pokendor
    if (isActive) {
      fill(255, 204, 0);        // amarelo = ativa agora
      stroke(180, 130, 0);
      strokeWeight(2);
    } else if (hasBuzina) {
      fill(130, 200, 255);      // azul claro = tem buzina instalada
      stroke(70, 140, 210);
      strokeWeight(1.2);
    } else {
      fill(230, 230, 230);      // cinza = sem buzina
      stroke(170);
      strokeWeight(1.2);
    }
    ellipse(pokeX[i], pokeY[i], pr * 2, pr * 2);

    // Número do pokendor (todos os círculos)
    fill(isActive ? 80 : 120);
    noStroke();
    textSize(pokeJunction[i] ? 6.5 : 5.5);
    textAlign(CENTER, CENTER);
    text(str(i + 1), pokeX[i], pokeY[i]);
  }
  noStroke();
}

// ─── BARRA SUPERIOR ──────────────────────────────────────
void drawTopBar() {
  fill(215); noStroke();
  rect(0, 0, width, 34);

  // Botão iniciar/parar
  float bx = 14, by = 6, bw = 160, bh = 22;
  if (running) fill(80, 0, 0); else fill(btnStartHover ? 190 : 215);
  stroke(125); strokeWeight(0.5); rect(bx, by, bw, bh, 5);
  fill(running ? 255 : 30); noStroke(); textSize(12); textAlign(CENTER, CENTER);
  text(running ? "■  Parar" : "▶  Iniciar ciclo", bx + bw / 2, by + bh / 2);

  // Botão reiniciar
  float rx2 = bx + bw + 8;
  fill(btnRHover ? 190 : 215); stroke(125); strokeWeight(0.5); rect(rx2, by, 90, bh, 5);
  fill(30); noStroke(); textAlign(CENTER, CENTER); textSize(12);
  text("↺  Reiniciar", rx2 + 45, by + bh / 2);

  // Status
  String bTxt;
  color bBg, bFg;
  if (!running) {
    bTxt = "Aguardando início";
    bBg = color(238, 230, 230); bFg = color(100, 0, 0);
  } else if (phase.equals("buzz")) {
    int[] ah = getActiveHorns();
    int   ph = ah[0];
    String hList = "";
    for (int k = 0; k < ah.length; k++) { if (k > 0) hList += ", "; hList += str(ah[k] + 1); }
    String cubaInfo = ah.length == 1
      ? " — cuba " + (pokeRing[ph] == 0 ? "A" : "B") + (pokeJunction[ph] ? " [junção]" : "")
      : " — " + str(ah.length / 2) + " por cuba (A+B)";
    bTxt = (ah.length == 1 ? "BUZINA " : "BUZINAS ") + hList +
           (ah.length == 1 ? " ATIVA" : " ATIVAS") + cubaInfo;
    bBg = color(220, 232, 224); bFg = color(30, 100, 60);
  } else {
    bTxt = "Intervalo — aguardando próxima buzina";
    bBg = color(238, 233, 218); bFg = color(120, 80, 20);
  }

  float statusX = rx2 + 98;
  textSize(12);
  fill(bBg); stroke(bFg); strokeWeight(0.5);
  rect(statusX, by, textWidth(bTxt) + 18, bh, 5);
  fill(bFg); noStroke(); textAlign(LEFT, CENTER);
  text(bTxt, statusX + 9, by + bh / 2);

  // Timer
  if (running) {
    String tt;
    if (phase.equals("gap")) {
      int sl = max(0, round((gapFrames() - phaseFrame) / float(FPS_SIM)));
      tt = "próxima buzina: " + sl + "s";
    } else {
      int sl = max(0, round((buzzFrames() - phaseFrame) / float(FPS_SIM)));
      tt = "buzina ativa: " + sl + "s";
    }
    fill(80); textSize(11); textAlign(RIGHT, CENTER);
    text(tt, width - 12, by + bh / 2);
  }

  // Barra de progresso
  float barY = 33, barH = 4;
  fill(180); noStroke(); rect(0, barY, width, barH);
  float pct = 0;
  if (running) {
    pct = phase.equals("gap") ?
      float(phaseFrame) / gapFrames() :
      float(phaseFrame) / buzzFrames();
  }
  fill(phase.equals("buzz") ? color(60, 110, 80) : color(120, 90, 30));
  rect(0, barY, width * pct, barH);
}

// ─── PAINEL ──────────────────────────────────────────────
void drawPanel() {
  int py2 = simH();
  fill(205); stroke(180); strokeWeight(1);
  rect(0, py2, width, PANEL_H);

  fill(60); textSize(13); textAlign(LEFT, TOP);
  text("Configurações", 14, py2 + 8);

  // Stats
  int sx = 14, sy = py2 + 28;
  int ph = (running && phase.equals("buzz")) ? primaryHorn() : 0;
  drawStatBox(sx,      sy, 160, "Fase",
    running ? (phase.equals("buzz") ? "Buzina " + str(ph+1) + " ativa" : "Intervalo") : "Parado");
  drawStatBox(sx + 175, sy, 140, "Cuba ativa",
    running && phase.equals("buzz") ? (pokeRing[ph] == 0 ? "A" : "B") : "—");
  drawStatBox(sx + 325, sy, 140, "Pokendors", str(N_POKES_TOTAL));
  drawStatBox(sx + 475, sy, 140, "Tipo",
    running && phase.equals("buzz") ? (pokeJunction[ph] ? "Junção" : "Anel") : "—");
  float pctMargem = constrain((gaugeCurrentP - P_OP_GAUGE) / (P_CHAPA_GAUGE - P_OP_GAUGE) * 100, 0, 100);
  drawStatBox(sx + 625, sy, 140, "Δ Pressão", nf(gaugeCurrentP - P_OP_GAUGE, 0, 1) + " mBar (" + nf(pctMargem,0,1) + "%)");

  drawPressureGauge(width - 58, simH() + 8, 50, PANEL_H - 16);

  // Legenda — à direita das duas colunas de sliders (cols terminam em x≈516)
  int lx = 558, ly = py2 + 76;
  drawLegendDot(lx, ly,      color(255, 204, 0),   "Buzina ativa");
  drawLegendDot(lx, ly + 22, color(130, 200, 255), "Com buzina");
  drawLegendDot(lx, ly + 44, color(230, 230, 230), "Sem buzina");
  drawLegendDot(lx, ly + 66, color(96, 160, 224),  "Onda acústica");

  // Sliders — linha 1
  int[] cols = { 28, 308 };
  int labelY1 = py2 + 72;
  String[] names1 = { "Intervalo entre buzinas", "Duração da buzina" };
  String[] descs1 = { "segundos de espera entre pulsos", "segundos que a buzina fica ligada" };
  String[] vals1  = { nf(sliderGapTime, 0, 1) + " s", nf(sliderBuzzTime, 0, 1) + " s" };
  for (int i = 0; i < 2; i++) {
    fill(40); textSize(12); textAlign(LEFT, BOTTOM); text(names1[i], cols[i], labelY1);
    fill(100); textSize(10); textAlign(LEFT, TOP);   text(descs1[i], cols[i], labelY1 + 2);
    fill(40); textSize(11); textAlign(LEFT, CENTER); text(vals1[i], cols[i] + 208, py2 + 88 + 8);
  }

  // Sliders — linha 2
  int labelY2 = py2 + 118;
  String hornCntLabel = str(numParticipating()) + " buzinas";
  int ns = numSimul();
  String simulLabel = ns == 1 ? "1 buzina (sequencial)" : str(ns) + " (" + str(ns/2) + " por cuba)";
  String[] names2 = { "Buzinas instaladas", "Simultâneas" };
  String[] descs2 = { "posições com buzina instalada", "quantas tocam ao mesmo tempo" };
  String[] vals2  = { hornCntLabel, simulLabel };
  for (int i = 0; i < 2; i++) {
    fill(40); textSize(12); textAlign(LEFT, BOTTOM); text(names2[i], cols[i], labelY2);
    fill(100); textSize(10); textAlign(LEFT, TOP);   text(descs2[i], cols[i], labelY2 + 2);
    fill(40); textSize(11); textAlign(LEFT, CENTER); text(vals2[i], cols[i] + 208, py2 + 135 + 8);
  }
}

void drawStatBox(float x, float y, float w, String label, String val) {
  fill(192); stroke(170); strokeWeight(0.5); rect(x, y, w, 32, 5);
  fill(90); noStroke(); textSize(10); textAlign(LEFT, TOP); text(label, x + 7, y + 4);
  fill(20); textSize(14); textAlign(LEFT, BOTTOM); text(val, x + 7, y + 30);
}

void drawLegendDot(float x, float y, color c, String label) {
  fill(c); noStroke(); ellipse(x + 5, y, 10, 10);
  fill(60); textSize(11); textAlign(LEFT, CENTER); text(label, x + 16, y);
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

// ─── MOUSE ───────────────────────────────────────────────
void mouseClicked() {
  if (mouseY >= simH()) return;
  float bx = 14, by = 6, bw = 160, bh = 22;
  if (mouseX >= bx && mouseX <= bx + bw && mouseY >= by && mouseY <= by + bh) {
    if (!running) { running = true; phase = "gap"; phaseFrame = 0; activeHornIdx = 0; }
    else { running = false; stopBuzzSound(); }
    return;
  }
  float rx2 = bx + bw + 8;
  if (mouseX >= rx2 && mouseX <= rx2 + 90 && mouseY >= by && mouseY <= by + bh) { resetSim(); return; }
}

void mouseMoved() {
  float bx = 14, by = 6, bw = 160, bh = 22, rx2 = bx + bw + 8;
  btnStartHover = mouseX >= bx && mouseX <= bx + bw && mouseY >= by && mouseY <= by + bh;
  btnRHover     = mouseX >= rx2 && mouseX <= rx2 + 90 && mouseY >= by && mouseY <= by + bh;
}

void resetSim() {
  running = false; phase = "idle"; phaseFrame = 0;
  activeHornIdx = 0; fr = 0; waveCount = 0;
  stopBuzzSound();
}

// ─── STOP ────────────────────────────────────────────────
void stop() {
  if (audioOut != null) audioOut.close();
  if (minim != null) minim.stop();
  super.stop();
}
