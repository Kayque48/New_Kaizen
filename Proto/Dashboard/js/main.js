import { addLog } from './log.js';
import { renderHorns } from './horns.js';
import { renderSensors } from './sensors.js';
import { renderPressure } from './pressure.js';
import { renderCharts } from './charts.js';
import { clock } from './clock.js';
import { mainLoop } from './loop.js';

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

// 500 ms tick drives all simulation and DOM updates
setInterval(mainLoop, 500);
