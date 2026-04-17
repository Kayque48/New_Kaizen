import { state } from './state.js';
import { SCRIPTS } from './config.js';
import { rnd } from './utils.js';
import { clock } from './clock.js';
import { addLog } from './log.js';
import { renderHorns } from './horns.js';
import { renderSensors } from './sensors.js';
import { renderPressure } from './pressure.js';
import { renderCharts } from './charts.js';

/**
 * Main simulation tick — called every 500 ms.
 *
 * Timing constants (at 500 ms/tick):
 *   60 ticks = 30 s → full cycle (buzz 10 s + rest 20 s)
 *   20 ticks = 10 s → buzz ON duration
 *   40 ticks = 20 s → rest duration
 */
export function mainLoop() {
  state.tick++;
  clock();

  // Cycle = 30 s: 6 triangulated pokens buzz for 10 s, rest for 20 s
  const cyclePos = state.tick % 60;
  if (cyclePos === 0) {
    state.buzzing = true;
    state.cycleCount++;
    const step = Math.floor(state.tick / 60) % 4;
    state.activeHorns = SCRIPTS[step];

    const aList = state.activeHorns.slice(0, 3).map(h => h + 1).join('+');
    const bList = state.activeHorns.slice(3).map(h => h + 1).join('+');
    addLog(`Pulso #${state.cycleCount} — A:[${aList}] B:[${bList}] — triângulo passo ${(step % 4) + 1}/4`);

    state.crustPct = Math.max(0, state.crustPct - 0.35);
    document.getElementById('m-cycles').textContent = state.cycleCount;
  } else if (cyclePos === 20) {
    state.buzzing = false;
    addLog('Intervalo — aguardando próximo pulso (20 s)', '');
  }

  // Temperature: update every 5 s (10 ticks) — slow thermal inertia
  if (state.tick % 10 === 0) {
    const tv = Math.round(rnd(491, 10));
    state.tempHist.push(tv);
    if (state.tempHist.length > 20) state.tempHist.shift();
    document.getElementById('sv-temp').textContent = tv + ' °C';
  }

  // Vibration: update every 1 s (2 ticks) — fast mechanical response
  if (state.tick % 2 === 0) {
    const vv = rnd(state.buzzing ? 0.20 : 0.13, 0.05);
    state.vibHist.push(parseFloat(vv.toFixed(2)));
    if (state.vibHist.length > 20) state.vibHist.shift();
    document.getElementById('sv-vib').textContent = vv.toFixed(2) + ' g';
  }

  // Occasional vibration warning mid-rest
  if (state.tick % 60 === 40 && Math.random() < 0.2) {
    addLog('Acelerômetro poke A-07: 0.28g — dentro do limite', 'log-warn');
  }

  // Crust accumulates continuously; resets at 100%
  state.crustPct += 0.004;
  if (state.crustPct > 100) state.crustPct = 0;
  document.getElementById('m-crust').textContent = state.crustPct.toFixed(1);

  const cb = document.getElementById('mb-crust');
  const mc = document.getElementById('mc-crust');
  if (state.crustPct < 10) {
    cb.textContent = 'canal limpo'; cb.className = 'mcard-badge badge-ok';  mc.className = 'mcard';
  } else if (state.crustPct < 50) {
    cb.textContent = 'acumulando';  cb.className = 'mcard-badge badge-warn'; mc.className = 'mcard warn';
  } else {
    cb.textContent = 'obstruído!';  cb.className = 'mcard-badge badge-alert'; mc.className = 'mcard alert';
  }

  // Active horn count display
  const av  = document.getElementById('m-active');
  const ab  = document.getElementById('mb-active');
  const mac = document.getElementById('mc-active');
  if (state.buzzing) {
    av.textContent = '6'; ab.textContent = 'trianguladas';
    ab.className = 'mcard-badge badge-ok';   mac.className = 'mcard';
  } else {
    av.textContent = '0'; ab.textContent = 'em espera';
    ab.className = 'mcard-badge badge-warn'; mac.className = 'mcard warn';
  }

  renderHorns();
  renderSensors();
  renderPressure();
  renderCharts();
}
