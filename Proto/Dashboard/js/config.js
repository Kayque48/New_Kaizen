/** Number of horn units per cuba (A and B). */
export const HORN_N = 18;

/**
 * Returns a Set of local pokendor indices (0–HORN_N-1) that have buzinas
 * installed for the given buzinas-per-pokendor configuration.
 */
export function installedPokes(buzPerPoke) {
  const count = Math.ceil(HORN_N / buzPerPoke);
  const step  = HORN_N / count;
  const set   = new Set();
  for (let i = 0; i < count; i++) set.add(Math.floor(i * step));
  return set;
}

/**
 * Triangular firing sequences — 4 rotation steps.
 * Each row defines [cubaA indexes..., cubaB indexes...] that fire together.
 */
export const SCRIPTS = [
  [0,  6,  12, 18, 24, 30],
  [6,  12, 0,  24, 30, 18],
  [12, 0,  6,  30, 18, 24],
  [3,  9,  15, 21, 27, 33],
];

/** Sensor definitions used to render the readings table. */
export const SENSORS = [
  { label: 'Termopar K',   poke: 'A-07', unit: '°C',   base: 492,  range: 12,   warn: 520, alert: 580 },
  { label: 'Termopar K',   poke: 'B-07', unit: '°C',   base: 488,  range: 10,   warn: 520, alert: 580 },
  { label: 'Pressão dif.', poke: 'A-01', unit: 'mBar', base: 358,  range: 6,    warn: 500, alert: 650 },
  { label: 'Acelerômetro', poke: 'A-13', unit: 'g',    base: 0.19, range: 0.05, warn: 0.8, alert: 1.5 },
  { label: 'Microfone',    poke: 'B-13', unit: 'dB',   base: 143,  range: 4,    warn: 155, alert: 160 },
];
