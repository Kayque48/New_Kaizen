const cv=document.getElementById('cv');
const ct=cv.getContext('2d');
let W=600,H=340;

// Cycle config (frames at 60fps)
// Escala: 1 min simulado = 2s reais
const FPS = 60;
const BUZZ_FRAMES = 10 * FPS;    // 10s reais por buzina
const HORN_GAP_FRAMES = 6 * FPS; // 6s reais = "3 minutos" entre buzinas

let running=false, on=false, fr=0;
let cyclePhase='idle'; // 'idle','buzz'
let phaseFrame=0;
let buzzHornIndex=0;   // buzina activa: 0, 1 ou 2
let hornSubPhase='buzz'; // 'buzz' ou 'gap'
let parts=[],waves=[],crustTiles=[];
let crustPct=0;
let audioCtx=null, buzzNode=null, gainNode=null;

function setup(){W=cv.offsetWidth||600;cv.width=W;cv.height=H;}

function rY(){return 30;}
function rB(){return 80;}
function fY(){return H-40;}
function lW(){return W*0.08;}
function rW(){return W-W*0.08;}
function lWm(){return W*0.13;}
function rWm(){return W-W*0.13;}
function mY(){return H*0.55;}
function lwX(y){if(y<=rB())return lW();if(y>=mY())return lWm();return lW()+(lWm()-lW())*((y-rB())/(mY()-rB()));}
function rwX(y){if(y<=rB())return rW();if(y>=mY())return rWm();return rW()+(rWm()-rW())*((y-rB())/(mY()-rB()));}
const COLS=[0.36,0.64];
function cHW(y){const t=Math.max(0,Math.min(1,(y-rB())/(fY()-rB())));return(W*0.085+(W*0.05-W*0.085)*t)/2;}
function inCanal(x,y){
  if(y<rB()+2||y>fY()-2)return false;
  if(x<lwX(y)+2||x>rwX(y)-2)return false;
  for(const c of COLS)if(Math.abs(x-W*c)<cHW(y)+2)return false;
  return true;
}
function randInCanal(){
  for(let i=0;i<40;i++){
    const x=lWm()+10+Math.random()*(rWm()-lWm()-20);
    const y=rB()+20+Math.random()*(fY()-rB()-40);
    if(inCanal(x,y))return{x,y};
  }
  return{x:W/2,y:(rB()+fY())/2};
}
const POKES=[0.20,0.50,0.80];

function startBuzzSound(){
  try{
    if(!audioCtx) audioCtx=new(window.AudioContext||window.webkitAudioContext)();
    if(audioCtx.state==='suspended') audioCtx.resume();

    // Parar nós anteriores imediatamente antes de criar novos
    if(buzzNode){try{buzzNode.stop();}catch(e){} buzzNode=null;}
    if(gainNode){try{gainNode.disconnect();}catch(e){} gainNode=null;}

    gainNode=audioCtx.createGain();
    gainNode.gain.setValueAtTime(0,audioCtx.currentTime);
    gainNode.gain.linearRampToValueAtTime(0.18,audioCtx.currentTime+0.3);
    gainNode.connect(audioCtx.destination);

    const o1=audioCtx.createOscillator();
    o1.type='sawtooth'; o1.frequency.value=118;
    const o1g=audioCtx.createGain(); o1g.gain.value=0.6;
    o1.connect(o1g); o1g.connect(gainNode); o1.start();

    const o2=audioCtx.createOscillator();
    o2.type='sine'; o2.frequency.value=240;
    const o2g=audioCtx.createGain(); o2g.gain.value=0.25;
    o2.connect(o2g); o2g.connect(gainNode); o2.start();

    const o3=audioCtx.createOscillator();
    o3.type='sine'; o3.frequency.value=362;
    const lfo=audioCtx.createOscillator();
    lfo.frequency.value=4;
    const lfoG=audioCtx.createGain(); lfoG.gain.value=6;
    lfo.connect(lfoG); lfoG.connect(o3.frequency);
    const o3g=audioCtx.createGain(); o3g.gain.value=0.15;
    o3.connect(o3g); o3g.connect(gainNode);
    o3.start(); lfo.start();

    const o4=audioCtx.createOscillator();
    o4.type='sawtooth'; o4.frequency.value=55;
    const o4g=audioCtx.createGain(); o4g.gain.value=0.2;
    o4.connect(o4g); o4g.connect(gainNode); o4.start();

    buzzNode={stop:()=>{try{o1.stop();o2.stop();o3.stop();o4.stop();lfo.stop();}catch(e){}}};
  }catch(e){}
}

function stopBuzzSound(){
  try{
    if(gainNode) gainNode.gain.setTargetAtTime(0,audioCtx.currentTime,0.2);
    setTimeout(()=>{
      try{if(buzzNode){buzzNode.stop();buzzNode=null;}}catch(e){}
      try{if(gainNode){gainNode.disconnect();gainNode=null;}}catch(e){}
    },400);
  }catch(e){}
}

function spawnPart(){
  const p=randInCanal();
  parts.push({x:p.x,y:p.y,vx:(Math.random()-0.5)*1.0,vy:on?(Math.random()-0.5)*2:-(Math.random()*0.6+0.2),r:Math.random()*2+1.5,age:0,life:1,drift:(Math.random()-0.5)*0.06});
}
function spawnWave(px){waves.push({x:px,y:rB()+6,r:0,a:0.75});}
function addCrust(x,y,surface){
  const key=`${Math.round(x/10)}_${Math.round(y/10)}_${surface}`;
  const ex=crustTiles.find(t=>t.key===key);
  if(ex){ex.s=Math.min(ex.s+2,12);}
  else crustTiles.push({key,x,y,surface,s:4,w:10+Math.random()*8});
  recalcCrust();
}
function recalcCrust(){crustPct=Math.min(100,crustTiles.reduce((a,t)=>a+t.s,0)/(12*50)*100);}

function drawBg(){ct.fillStyle='#fff';ct.fillRect(0,0,W,H);}
function drawStructure(){
  const rb=rB(),fy=fY();
  ct.fillStyle='#2a1a10';
  ct.beginPath();ct.moveTo(lW(),rb);ct.lineTo(rW(),rb);ct.lineTo(rWm(),mY());ct.lineTo(rWm(),fy);ct.lineTo(lWm(),fy);ct.lineTo(lWm(),mY());ct.closePath();ct.fill();
  ct.fillStyle='#9a9690';ct.fillRect(0,rY(),W,rb-rY());ct.fillRect(0,fy,W,H-fy);
  ct.fillStyle='#787570';
  ct.beginPath();ct.moveTo(0,rb);ct.lineTo(lW(),rb);ct.lineTo(lWm(),mY());ct.lineTo(lWm(),fy);ct.lineTo(0,fy);ct.closePath();ct.fill();
  ct.beginPath();ct.moveTo(W,rb);ct.lineTo(rW(),rb);ct.lineTo(rWm(),mY());ct.lineTo(rWm(),fy);ct.lineTo(W,fy);ct.closePath();ct.fill();
  COLS.forEach(c=>{
    const cx=W*c,tw=cHW(rb),bw=cHW(fy);
    ct.fillStyle='#555250';ct.beginPath();ct.moveTo(cx-tw,rb);ct.lineTo(cx+tw,rb);ct.lineTo(cx+bw,fy);ct.lineTo(cx-bw,fy);ct.closePath();ct.fill();
    ct.strokeStyle='#9a9690';ct.lineWidth=0.5;ct.stroke();
  });
  POKES.forEach(pr=>{
    const px=W*pr,pw=W*0.06;
    ct.fillStyle='#444';ct.fillRect(px-pw/2,rY(),pw,rb-rY());
    ct.strokeStyle='#aaa';ct.lineWidth=1;ct.strokeRect(px-pw/2,rY(),pw,rb-rY());
  });
  ct.fillStyle='rgba(200,180,140,0.4)';ct.font='10px sans-serif';ct.fillText('canal crossover 1100°C',W/2-55,rb+16);
  ct.fillStyle='#bbb';ct.fillText('refratário',4,rb-4);
}
function drawCrust(){
  crustTiles.forEach(t=>{
    const s=t.s,w=t.w;
    ct.fillStyle='#8B2800';
    if(t.surface==='roof'){ct.fillRect(t.x-w/2,t.y,w,s);ct.fillStyle='#D85A30';ct.fillRect(t.x-w/2,t.y+s-2,w,2);}
    else if(t.surface==='left'){ct.fillRect(t.x,t.y-w/2,s,w);ct.fillStyle='#D85A30';ct.fillRect(t.x+s-2,t.y-w/2,2,w);}
    else if(t.surface==='right'){ct.fillRect(t.x-s,t.y-w/2,s,w);ct.fillStyle='#D85A30';ct.fillRect(t.x-s,t.y-w/2,2,w);}
    else{ct.fillRect(t.x-s/2,t.y-w/2,s,w);}
  });
}
function drawWaves(){
  waves.forEach(w=>{
    ct.beginPath();ct.arc(w.x,w.y,w.r,0,Math.PI*2);
    ct.strokeStyle=`rgba(93,202,165,${w.a})`;ct.lineWidth=1.5;ct.stroke();
  });
}
function drawParts(){
  parts.forEach(p=>{
    const a=Math.min(1,p.age/12);
    ct.beginPath();ct.arc(p.x,p.y,p.r,0,Math.PI*2);
    ct.fillStyle=`rgba(232,132,90,${a*0.9})`;ct.fill();
  });
}
function drawHorns(){
  const rb=rB();
  POKES.forEach((pr,i)=>{
    const px=W*pr,pw=W*0.06;
    const active=on&&cyclePhase==='buzz'&&i===buzzHornIndex;
    const done=cyclePhase==='buzz'&&i<buzzHornIndex;
    ct.fillStyle=active?'#1D9E75':done?'#2a7a5a':'#666';
    ct.beginPath();ct.moveTo(px-pw/2+2,rb-1);ct.lineTo(px+pw/2-2,rb-1);ct.lineTo(px+pw/2-5,rb+9);ct.lineTo(px-pw/2+5,rb+9);ct.closePath();ct.fill();
    if(active){ct.fillStyle='#085041';ct.beginPath();ct.arc(px,rb-6,3,0,Math.PI*2);ct.fill();}
  });
}

function fmtTime(frames){
  // acum phase: show as "10 min" countdown scaled
  const totalSec=Math.round(frames/FPS);
  if(cyclePhase==='acum'){
    const minLeft=Math.round((ACUM_FRAMES-phaseFrame)/ACUM_FRAMES*10);
    return `~${minLeft} min restantes`;
  }
  return `${Math.max(0,Math.round((BUZZ_FRAMES-phaseFrame)/FPS))}s restantes`;
}

function updateUI(){
  const bdg=document.getElementById('bdg');
  const fase=document.getElementById('sFase');
  const fill=document.getElementById('pbarFill');
  const label=document.getElementById('pbarLabel');

  if(!running){
    bdg.textContent='Aguardando início';bdg.className='bdg boff';
    fase.textContent='—';
    fill.style.width='0%';label.textContent='—';
    return;
  }
  if(hornSubPhase==='buzz'){
    const pct=Math.round(phaseFrame/BUZZ_FRAMES*100);
    bdg.textContent=`BUZINA ${buzzHornIndex+1} LIGADA — limpeza acústica`;bdg.className='bdg bon';
    fase.textContent=`🔊 Buzina ${buzzHornIndex+1}/3`;
    fill.style.background='#1D9E75';fill.style.width=pct+'%';
    label.textContent=`Buzina ${buzzHornIndex+1}: ${Math.max(0,Math.round((BUZZ_FRAMES-phaseFrame)/FPS))}s restantes`;
  } else {
    const nextHorn=(buzzHornIndex+1)%POKES.length+1;
    const pct=Math.round(phaseFrame/HORN_GAP_FRAMES*100);
    bdg.textContent=`Aguardando buzina ${nextHorn} (~3 min)`;bdg.className='bdg bwait';
    fase.textContent=`⏳ Intervalo — próxima: buzina ${nextHorn}`;
    fill.style.background='#BA7517';fill.style.width=pct+'%';
    label.textContent=`Próxima buzina em: ${Math.max(0,Math.round((HORN_GAP_FRAMES-phaseFrame)/FPS/2))} min (simulado)`;
  }

  document.getElementById('sP').textContent=parts.length;
  document.getElementById('sC').textContent=Math.round(crustPct)+'%';
  const el=document.getElementById('sS');
  if(crustPct<5){el.textContent='Limpo';el.style.color='#0F6E56';}
  else if(crustPct<50){el.textContent='Acumulando';el.style.color='#BA7517';}
  else{el.textContent='Obstruído!';el.style.color='#a00';}
}

function loop(){
  fr++;
  ct.clearRect(0,0,W,H);

  if(running){
    phaseFrame++;

    if(cyclePhase==='buzz'){
      if(hornSubPhase==='buzz'){
        if(phaseFrame>=BUZZ_FRAMES){
          on=false; stopBuzzSound(); phaseFrame=0; hornSubPhase='gap';
        }
      } else { // gap entre buzinas
        if(phaseFrame>=HORN_GAP_FRAMES){
          buzzHornIndex=(buzzHornIndex+1)%POKES.length; hornSubPhase='buzz'; phaseFrame=0; on=true; startBuzzSound();
        }
      }
    }

    if(fr%(on?5:9)===0) spawnPart();
    if(on&&fr%20===0) spawnWave(W*POKES[buzzHornIndex]);
  }

  waves.forEach(w=>{w.r+=3.5;w.a-=0.022;});
  waves=waves.filter(w=>w.a>0);

  const rb=rB(),fy=fY();
  parts.forEach(p=>{
    p.age++;
    if(on){
      let fx=0,fy2=0;
      POKES.forEach(pr=>{const dx=p.x-W*pr,dy=p.y-rb;const d=Math.sqrt(dx*dx+dy*dy)+1;const f=50/(d*d);fx+=f*dx/d;fy2+=f*dy/d;});
      p.vx+=fx*0.025+(Math.random()-0.5)*0.55;p.vy+=fy2*0.025+(Math.random()-0.5)*0.55;p.vx*=0.88;p.vy*=0.88;
    } else {
      p.vy-=0.02;p.vx+=p.drift;p.vx*=0.98;p.vy*=0.99;
    }
    p.x+=p.vx;p.y+=p.vy;
    const lx=lwX(p.y),rx=rwX(p.y);
    if(p.y<rb+p.r){if(!on){addCrust(p.x,rb,'roof');p.life=0;return;}p.y=rb+p.r;p.vy*=-0.4;}
    if(p.y>fy-p.r){p.y=fy-p.r;p.vy*=-0.4;}
    if(p.x<lx+p.r){if(!on){addCrust(lx,p.y,'left');p.life=0;return;}p.x=lx+p.r;p.vx*=-0.4;}
    if(p.x>rx-p.r){if(!on){addCrust(rx,p.y,'right');p.life=0;return;}p.x=rx-p.r;p.vx*=-0.4;}
    for(const c of COLS){
      const cxc=W*c,hw=cHW(p.y);
      if(Math.abs(p.x-cxc)<hw+p.r){
        if(!on){addCrust(cxc+(p.x<cxc?-hw:hw),p.y,'col');p.life=0;return;}
        p.vx=p.x<cxc?-Math.abs(p.vx):Math.abs(p.vx);p.x+=p.vx*2;
      }
    }
    if(on&&p.age>140)p.life=0;
  });
  parts=parts.filter(p=>p.life>0);

  if(on&&crustTiles.length>0){
    const hornX=W*POKES[buzzHornIndex];
    const range=W*0.22;
    crustTiles.forEach(t=>{if(Math.abs(t.x-hornX)<range)t.s=Math.max(0,t.s-0.18);});
    crustTiles=crustTiles.filter(t=>t.s>0);
    recalcCrust();
  }

  drawBg();drawStructure();drawCrust();drawWaves();drawParts();drawHorns();
  updateUI();
  requestAnimationFrame(loop);
}

document.getElementById('btnStart').addEventListener('click',()=>{
  if(!running){
    running=true;cyclePhase='buzz';phaseFrame=0;buzzHornIndex=0;hornSubPhase='buzz';on=true;startBuzzSound();
    document.getElementById('btnStart').textContent='Parar';
    document.getElementById('btnStart').classList.add('stop');
  } else {
    running=false;on=false;stopBuzzSound();
    document.getElementById('btnStart').textContent='Iniciar ciclo automático';
    document.getElementById('btnStart').classList.remove('stop');
  }
});

document.getElementById('btnR').addEventListener('click',()=>{
  running=false;on=false;fr=0;phaseFrame=0;cyclePhase='idle';
  buzzHornIndex=0;hornSubPhase='buzz';
  parts=[];waves=[];crustTiles=[];crustPct=0;
  stopBuzzSound();
  document.getElementById('btnStart').textContent='Iniciar ciclo automático';
  document.getElementById('btnStart').classList.remove('stop');
  document.getElementById('bdg').textContent='Aguardando início';
  document.getElementById('bdg').className='bdg boff';
});

setup();loop();
