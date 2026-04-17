import { state } from './state.js';
import { HORN_N, installedPokes } from './config.js';

/**
 * Re-renders both horn grids (Cuba A and B).
 * Pokendors not installed per buzPerPoke config are grayed (horn-off).
 * Horn index 33 (pokendor 34) is permanently marked as faulted when installed.
 */
export function renderHorns() {
  const installed = installedPokes(state.buzPerPoke);

  ['a', 'b'].forEach((cuba, cubaIndex) => {
    const container = document.getElementById('horns-' + cuba);
    container.innerHTML = '';

    for (let i = 0; i < HORN_N; i++) {
      const g       = cubaIndex * HORN_N + i;
      const hasHorn = installed.has(i);
      const isActive = hasHorn && state.buzzing && state.activeHorns.includes(g);
      const isFault  = g === 33 && hasHorn;

      let cls;
      if (!hasHorn)      cls = 'horn horn-off';
      else if (isFault)  cls = 'horn horn-fault';
      else if (isActive) cls = 'horn horn-active';
      else               cls = 'horn horn-ok';

      const el = document.createElement('div');
      el.className = cls;
      el.textContent = g + 1;
      el.title = !hasHorn
        ? `Pokendor ${g + 1} — sem buzina`
        : `Pokendor ${g + 1}${isFault ? ' — FALHA' : isActive ? ' — ATIVA' : ' — OK'}`;
      container.appendChild(el);
    }
  });
}
