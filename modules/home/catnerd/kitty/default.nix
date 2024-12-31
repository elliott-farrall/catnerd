{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.kitty.catnerd;
  enable = cfg.enable && config.programs.kitty.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.kitty.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd kitty theme";
    };
  };

  config = lib.mkIf enable {
    programs.kitty = {
      themeFile = "Catppuccin-${lib.catnerd.mkUpper flavour}";
      font = {
        package = pkgs.nerdfonts;
        name = "${config.catnerd.fonts.mono.family} Nerd Font";
        size = config.catnerd.fonts.mono.size;
      };
    };
  };
}
