import { state } from './state.js';
import { rnd } from './utils.js';

const P_NORMAL = 350; // mBar — normal operating pressure
const P_LIMIT  = 700; // mBar — safety limit (gauge max)

/** Updates the pressure gauge fill, readout labels, and sparkline history. */
export function renderPressure() {
  const target = state.buzzing ? 375.3 : 350.8;
  const p = rnd(target, 2.5);

  const pctMargin = Math.max(0, (p - P_NORMAL) / P_NORMAL * 100);
  const fillPct   = (p / P_LIMIT * 100).toFixed(1);

  const fill = document.getElementById('p-fill');
  fill.style.height     = fillPct + '%';
  fill.style.background = p > 600 ? 'var(--red-700)' : p > 400 ? 'var(--amber-600)' : 'var(--green-600)';

  document.getElementById('p-val').textContent = p.toFixed(1) + ' mBar';
  document.getElementById('p-pct').textContent = pctMargin.toFixed(1) + '% da margem';

  const safe = document.getElementById('p-safe');
  if (p > 600) {
    safe.textContent = '⚠ atenção';
    safe.style.color = 'var(--red-700)';
  } else {
    safe.textContent = '✓ seguro';
    safe.style.color = 'var(--green-600)';
  }

  state.pressHist.push(Math.round(p));
  if (state.pressHist.length > 20) state.pressHist.shift();

  document.getElementById('sv-press').textContent = Math.round(p) + ' mBar';
}
