BOOTMAGIC_ENABLE = no       # Enable Bootmagic Lite
MOUSEKEY_ENABLE = yes       # Mouse keys
EXTRAKEY_ENABLE = yes       # Audio control and System control
CONSOLE_ENABLE = yes        # Console for debug (qmk console / hid_listen)
RAW_ENABLE = yes            # Raw HID (Vial/VIA transport, custom HID commands)
COMMAND_ENABLE = yes        # Commands for debug and configuration
NKRO_ENABLE = yes
BACKLIGHT_ENABLE = no       # Enable keyboard backlight functionality
AUDIO_ENABLE = no           # Audio output
RGBLIGHT_ENABLE = no        # Enable WS2812 RGB underlight.
UNICODE_ENABLE = yes        # Unicode
LEADER_ENABLE = yes

COMBO_ENABLE = yes
INTROSPECTION_KEYMAP_C = combo.c
#SRC += combo.c

VIA_ENABLE = yes            # VIA protocol (dynamic keymap over Raw HID)
