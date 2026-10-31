#ifndef CONFIG_USER_H
#define CONFIG_USER_H

#include "../../config.h"

// place overrides here
//#define IGNORE_MOD_TAP_INTERRUPT
#define TAPPING_TERM 150
// #define TAPPING_TOGGLE 2
#define COMBO_COUNT 2

#define VIAL_KEYBOARD_UID {0x0A, 0xEA, 0x94, 0x9E, 0x1E, 0x04, 0xC2, 0x1E}
#define VIAL_UNLOCK_COMBO_ROWS { 12 }
#define VIAL_UNLOCK_COMBO_COLS { 0 }
#define DYNAMIC_KEYMAP_LAYER_COUNT 3
#endif
