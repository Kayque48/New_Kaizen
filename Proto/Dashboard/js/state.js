/**
 * Shared mutable application state.
 * All modules import this object and mutate its properties directly.
 */
export const state = {
  tick:       0,
  buzzing:    false,
  cycleCount: 142,
  crustPct:   4.2,
  buzPerPoke: 1,

  /** Global horn indexes currently firing. */
  activeHorns: [],

  logs: [],

  tempHist:  [482, 489, 495, 488, 492, 491, 487, 490, 493, 486, 488, 491, 494, 489, 492],
  pressHist: [351, 358, 356, 362, 357, 359, 355, 360, 358, 354, 357, 361, 356, 359, 358],
  vibHist:   [0.12, 0.18, 0.21, 0.15, 0.19, 0.22, 0.16, 0.20, 0.18, 0.14, 0.17, 0.21, 0.19, 0.16, 0.20],
  dbHist:    [88, 86, 89, 87, 85, 90, 87, 88, 86, 89, 87, 86, 88, 90, 87],
};
