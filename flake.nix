{
  description = "QMK firmware build environment";

  # Resolves through the flake registry, i.e. the system nixpkgs
  # (pinned via ~/.config/flakesync).
  inputs.nixpkgs.url = "nixpkgs";

  outputs =
    { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs:
        let
          avrlibc = pkgs.pkgsCross.avr.avrlibc;

          avr_incflags = [
            "-isystem ${avrlibc}/avr/include"
            "-B${avrlibc}/avr/lib/avr5"
            "-L${avrlibc}/avr/lib/avr5"
            "-B${avrlibc}/avr/lib/avr35"
            "-L${avrlibc}/avr/lib/avr35"
            "-B${avrlibc}/avr/lib/avr51"
            "-L${avrlibc}/avr/lib/avr51"
          ];
        in
        {
          default = pkgs.mkShell {
            name = "qmk-firmware";

            packages = with pkgs; [
              clang-tools
              dfu-programmer
              dfu-util
              diffutils
              git
              qmk
              # ARM (e.g. Teensy 3.6 / MK66FX1M0 in the kinT kint36)
              gcc-arm-embedded
              teensy-loader-cli
              # AVR (e.g. AT90USB1286 / ATmega32U4 boards).
              # NOTE: avrlibc must NOT go in packages (its meta.platforms
              # is avr-only); it is referenced via AVR_CFLAGS/AVR_ASFLAGS
              # below instead.
              pkgsCross.avr.stdenv.cc
              avrdude
            ];

            AVR_CFLAGS = avr_incflags;
            AVR_ASFLAGS = avr_incflags;

            shellHook = ''
              # Prevent the avr-gcc wrapper from picking up host GCC flags
              # like -iframework, which is problematic on Darwin
              unset NIX_CFLAGS_COMPILE_FOR_TARGET
            '';
          };
        });
    };
}
