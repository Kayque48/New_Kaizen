import { state } from './state.js';
import { rnd } from './utils.js';

const P_NORMAL = 350;
const P_LIMIT  = 700;

function mbarChart(data) {
  const svg = document.getElementById('mbar-chart');
  const w = 300, h = 90, padL = 28, padR = 6, padT = 8, padB = 8;
  const minY = 300, maxY = 750;
  const yRange = maxY - minY;
  const innerW = w - padL - padR;
  const innerH = h - padT - padB;
  const n = data.length;
  const xStep = innerW / Math.max(n - 1, 1);

  const pts = data.map((v, i) => [
    padL + i * xStep,
    padT + (1 - (v - minY) / yRange) * innerH,
  ]);

  const line = pts.map((p, i) => (i === 0 ? `M${p[0].toFixed(1)},${p[1].toFixed(1)}` : `L${p[0].toFixed(1)},${p[1].toFixed(1)}`)).join(' ');
  const last = pts[pts.length - 1];
  const area = `${line} L${last[0].toFixed(1)},${(padT + innerH).toFixed(1)} L${padL},${(padT + innerH).toFixed(1)} Z`;

  const yNormal = (padT + (1 - (P_NORMAL - minY) / yRange) * innerH).toFixed(1);
  const yLimit  = (padT + (1 - (P_LIMIT  - minY) / yRange) * innerH).toFixed(1);

  svg.innerHTML = `
    <rect x="0" y="0" width="${w}" height="${h}" fill="var(--gray-50)" rx="2"/>
    <line x1="${padL}" y1="${yLimit}" x2="${w - padR}" y2="${yLimit}" stroke="var(--red-700)" stroke-width="0.8" stroke-dasharray="4,3" opacity="0.7"/>
    <text x="${padL - 3}" y="${parseFloat(yLimit) + 3}" font-size="7" font-family="monospace" fill="var(--red-700)" text-anchor="end">700</text>
    <line x1="${padL}" y1="${yNormal}" x2="${w - padR}" y2="${yNormal}" stroke="var(--blue-500)" stroke-width="0.8" stroke-dasharray="4,3" opacity="0.7"/>
    <text x="${padL - 3}" y="${parseFloat(yNormal) + 3}" font-size="7" font-family="monospace" fill="var(--blue-600)" text-anchor="end">350</text>
    <path d="${area}" fill="var(--blue-500)" opacity="0.15"/>
    <path d="${line}" fill="none" stroke="var(--blue-600)" stroke-width="1.5" stroke-linejoin="round"/>
    <circle cx="${last[0].toFixed(1)}" cy="${last[1].toFixed(1)}" r="2.5" fill="var(--blue-600)"/>`;
}

export function renderPressure() {
  const target = state.buzzing ? 375.3 : 350.8;
  const p = rnd(target, 2.5);

  const pctMargin = Math.max(0, (p - P_NORMAL) / P_NORMAL * 100);

  document.getElementById('p-val').textContent = p.toFixed(1) + ' mBar';
  document.getElementById('p-pct').textContent = pctMargin.toFixed(1) + '% da margem';

  const safe = document.getElementById('p-safe');
  if (p > 600) {
    safe.textContent = '⚠ atenção';
    safe.style.color = 'var(--red-700)';
  } else {
    safe.textContent = '✓ seguro';
    safe.style.color = 'var(--blue-600)';
  }

  state.pressHist.push(Math.round(p));
  if (state.pressHist.length > 20) state.pressHist.shift();

  const db = rnd(state.buzzing ? 125 : 88, 4);
  state.dbHist.push(parseFloat(db.toFixed(1)));
  if (state.dbHist.length > 20) state.dbHist.shift();
  document.getElementById('sv-db').textContent = db.toFixed(0) + ' dB';

  mbarChart(state.pressHist);
}
