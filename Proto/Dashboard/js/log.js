import { state } from './state.js';

const MAX_LOGS = 30;

/**
 * Prepends a message to the activity log and re-renders the list.
 * Trims to MAX_LOGS entries so the log doesn't grow unboundedly.
 *
 * @param {string} msg - Message text
 * @param {string} cls - CSS class: 'log-ok' | 'log-warn' | ''
 */
export function addLog(msg, cls = 'log-ok') {
  const t = new Date().toLocaleTimeString('pt-BR');
  state.logs.unshift({ t, msg, cls });
  if (state.logs.length > MAX_LOGS) state.logs.pop();

  document.getElementById('activity-log').innerHTML = state.logs
    .map(l => `<div class="log-item">
      <span class="log-time">${l.t}</span>
      <span class="log-msg ${l.cls}">${l.msg}</span>
    </div>`)
    .join('');
}
