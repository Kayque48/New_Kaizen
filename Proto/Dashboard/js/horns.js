import { state } from './state.js';
import { HORN_N } from './config.js';

/**
 * Re-renders both horn grids (Cuba A and B).
 * Horn index 33 (pokendor 34) is permanently marked as faulted.
 */
export function renderHorns() {
  ['a', 'b'].forEach((cuba, cubaIndex) => {
    const container = document.getElementById('horns-' + cuba);
    container.innerHTML = '';

    for (let i = 0; i < HORN_N; i++) {
      const g       = cubaIndex * HORN_N + i;
      const isActive = state.buzzing && state.activeHorns.includes(g);
      const isFault  = g === 33;

      const el = document.createElement('div');
      el.className = 'horn ' + (isFault ? 'horn-fault' : isActive ? 'horn-active' : 'horn-ok');
      el.textContent = g + 1;
      el.title = `Pokendor ${g + 1}${isFault ? ' — FALHA' : isActive ? ' — ATIVA' : ' — OK'}`;
      container.appendChild(el);
    }
  });
}
