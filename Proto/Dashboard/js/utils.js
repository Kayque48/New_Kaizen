/** Returns a random value within ±range/2 of base. */
export function rnd(base, range) {
  return base + (Math.random() - 0.5) * range;
}

/** Formats a sensor value with the appropriate precision for its unit. */
export function fmt(v, unit) {
  if (unit === 'g')    return v.toFixed(2) + ' g';
  if (unit === '°C')   return Math.round(v) + ' °C';
  if (unit === 'mBar') return Math.round(v) + ' mBar';
  if (unit === 'dB')   return Math.round(v) + ' dB';
  return String(v);
}
