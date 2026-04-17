/** Updates the header clock element with the current date and time. */
export function clock() {
  const now = new Date();
  document.getElementById('clock-display').textContent =
    now.toLocaleTimeString('pt-BR') + ' · ' + now.toLocaleDateString('pt-BR');
}
