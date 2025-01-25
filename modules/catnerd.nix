{ config
, lib
, pkgs
, ...
}:

{
  options.catnerd = {
    enable = lib.mkEnableOption "Enable CatNerd theming";

    flavour = lib.mkOption {
      type = lib.types.enum lib.catnerd.flavours;
      default = "macchiato";
      description = "Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.types.enum lib.catnerd.accents;
      default = "blue";
      description = "Catppuccin accent";
    };

    cursor = {
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
        description = "Cursor size";
      };
    };

    fonts = {
      main = {
        family = lib.mkOption {
          type = lib.types.enum (builtins.attrNames lib.catnerd.mainFonts);
          default = "Ubuntu";
          description = "Main nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Main nerdfont size";
        };
        pkg = lib.mkOption {
          type = lib.types.package;
          default = pkgs.nerd-fonts.${lib.catnerd.mainFonts.${config.catnerd.fonts.main.family}};
          description = "Main nerdfont package";
        };
      };
      mono = {
        family = lib.mkOption {
          type = lib.types.enum (builtins.attrNames lib.catnerd.monoFonts);
          default = "DroidSansM";
          description = "Mono nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 12;
          description = "Mono nerdfont size";
        };
        pkg = lib.mkOption {
          type = lib.types.package;
          default = pkgs.nerd-fonts.${lib.catnerd.monoFonts.${config.catnerd.fonts.mono.family}};
          description = "Mono nerdfont package";
        };
      };
    };
  };
}
