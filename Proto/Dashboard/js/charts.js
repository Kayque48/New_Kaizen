import { state } from './state.js';

/**
 * Draws a filled area sparkline inside an SVG element.
 *
 * @param {string}   id     - Target SVG element ID
 * @param {number[]} data   - Data point array
 * @param {string}   stroke - Line color
 * @param {string}   fill   - Area fill color
 * @param {number}   minY   - Y-axis minimum (clamps bottom of range)
 * @param {number}   maxY   - Y-axis maximum (clamps top of range)
 */
function sparkline(id, data, stroke, fill, minY, maxY) {
  const svg    = document.getElementById(id);
  const n      = data.length;
  const w      = 200, h = 55, pad = 3;
  const xStep  = (w - pad * 2) / Math.max(n - 1, 1);
  const yRange = maxY - minY || 1;

  const pts = data.map((v, i) => [
    pad + i * xStep,
    h - pad - ((v - minY) / yRange) * (h - pad * 2),
  ]);

  const line = pts.map((p, i) => (i === 0 ? `M${p[0]},${p[1]}` : `L${p[0]},${p[1]}`)).join(' ');
  const last = pts[pts.length - 1];
  const area = `${line} L${last[0]},${h - pad} L${pad},${h - pad} Z`;

  svg.innerHTML = `
    <path d="${area}" fill="${fill}" opacity="0.3"/>
    <path d="${line}" fill="none" stroke="${stroke}" stroke-width="1.5" stroke-linejoin="round"/>
    <circle cx="${last[0]}" cy="${last[1]}" r="2.5" fill="${stroke}"/>`;
}

/** Redraws all three sparkline charts from current state history arrays. */
export function renderCharts() {
  sparkline('sc-temp',  state.tempHist,  '#2d7a45', '#3d9455', 465, 515);
  sparkline('sc-press', state.pressHist, '#185fa5', '#378add', 348, 395);
  sparkline('sc-vib',   state.vibHist,   '#854f0b', '#ba7517', 0.05, 0.32);
}
