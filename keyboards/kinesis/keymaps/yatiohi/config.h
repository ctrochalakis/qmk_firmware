#ifndef CONFIG_USER_H
#define CONFIG_USER_H

#include "../../config.h"

// place overrides here
//#define IGNORE_MOD_TAP_INTERRUPT
#define TAPPING_TERM 150
// #define TAPPING_TOGGLE 2
#define COMBO_COUNT 2

// Combo chord window; QMK default is 50ms.
#define COMBO_TERM 40

// Board default is 20ms (upstream kint36 heritage); QMK default is 5.
// Generated info_config.h defines it first, so undefine before overriding.
#ifdef DEBOUNCE
#    undef DEBOUNCE
#endif
#define DEBOUNCE 5

#define DYNAMIC_KEYMAP_LAYER_COUNT 3
#endif
