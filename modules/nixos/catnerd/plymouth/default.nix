{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.boot.plymouth.catnerd;
  enable = cfg.enable && config.boot.plymouth.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    boot.plymouth.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd plymouth theme";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    boot.plymouth = {
      themePackages = [
        (pkgs.catnerd.catppuccin-plymouth.override { inherit flavour accent; })
      ];
      theme = "catppuccin-${flavour}";

      font = "${config.catnerd.fonts.mono.pkg}/share/fonts/opentype/NerdFonts/${config.catnerd.fonts.mono.family}/${config.catnerd.fonts.mono.family}NerdFontMono-Regular.otf";
    };
  };
}
