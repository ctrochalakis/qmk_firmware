#include QMK_KEYBOARD_H
#include "combo.h"

const uint16_t PROGMEM esc[] = {KC_D, KC_F, COMBO_END};
const uint16_t PROGMEM bsp[] = {KC_J, KC_K, COMBO_END};

combo_t key_combos[COMBO_COUNT] = {
    [ESC] = COMBO(esc, KC_ESC),
    [BSP] = COMBO(bsp, KC_BSPC),
};
