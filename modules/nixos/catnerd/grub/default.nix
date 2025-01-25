{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.boot.loader.grub.catnerd;
  enable = cfg.enable && config.boot.loader.grub.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    boot.loader.grub.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd grub theme";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    boot.loader.grub = {
      theme = "${pkgs.catnerd.catppuccin-grub.override { inherit flavour accent; }}";
      splashImage = pkgs.catnerd.catppuccin-splash.override { inherit flavour accent; };

      font = "${config.catnerd.fonts.mono.pkg}/share/fonts/opentype/NerdFonts/${config.catnerd.fonts.mono.family}NerdFontMono-Regular.otf";
      fontSize = config.catnerd.fonts.mono.size;
    };
  };
}
