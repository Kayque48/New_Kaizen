import { SENSORS } from './config.js';
import { rnd, fmt } from './utils.js';

/** Rebuilds the sensor readings table with fresh simulated values. */
export function renderSensors() {
  const tbody = document.getElementById('sensor-tbody');
  tbody.innerHTML = SENSORS.map(s => {
    const v     = rnd(s.base, s.range);
    const cls   = v >= s.alert ? 'val-alert'   : v >= s.warn ? 'val-warn'   : 'val-ok';
    const badge = v >= s.alert ? 'badge-alert'  : v >= s.warn ? 'badge-warn'  : 'badge-ok';
    const label = v >= s.alert ? '⚠ alerta'    : v >= s.warn ? '~ aviso'    : '✓ ok';
    return `<tr>
      <td>${s.label}</td>
      <td class="mono" style="color:var(--gray-300)">${s.poke}</td>
      <td class="${cls}">${fmt(v, s.unit)}</td>
      <td><span class="mcard-badge ${badge}">${label}</span></td>
    </tr>`;
  }).join('');
}
