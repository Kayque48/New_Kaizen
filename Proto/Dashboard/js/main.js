import { state } from './state.js';
import { addLog } from './log.js';
import { renderHorns } from './horns.js';
import { renderSensors } from './sensors.js';
import { renderPressure } from './pressure.js';
import { renderCharts } from './charts.js';
import { clock } from './clock.js';
import { mainLoop } from './loop.js';
import { HORN_N } from './config.js';

// Boot log
addLog('Sistema iniciado — 84 buzinas online', 'log-ok');
addLog('ESP32 conectado via MQTT · Wi-Fi industrial', 'log-ok');
addLog('Dashboard sincronizado · Node-RED · Grafana', 'log-ok');
addLog('Pokendor 34 — falha detectada · manutenção agendada', 'log-warn');

// Initial render before first tick
renderHorns();
renderSensors();
renderPressure();
renderCharts();
clock();

// Simulation slider — buzinas per pokendor
document.getElementById('buz-per-poke').addEventListener('input', e => {
  const v = parseInt(e.target.value, 10);
  state.buzPerPoke = v;
  const perCuba = Math.ceil(HORN_N / v);
  document.getElementById('buz-per-poke-val').textContent = `${v} buz · ${perCuba}/cuba`;
  renderHorns();
});

// 500 ms tick drives all simulation and DOM updates
setInterval(mainLoop, 500);
