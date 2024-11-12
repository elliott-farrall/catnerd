{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.gtk.catnerd;
  enable = cfg.enable;

  inherit (config.catnerd) flavour accent;

  theme = {
    name = "catppuccin-${flavour}-${accent}-compact+rimless";
    package = pkgs.catppuccin-gtk.override {
      variant = flavour;
      accents = [ accent ];
      size = "compact";
      tweaks = [ "rimless" ];
    };
  };
in
{
  options = {
    gtk.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd GTK theme";
    };
  };

  config = lib.mkIf enable {
    environment = {
      variables.GTK_THEME = theme.name;
      systemPackages = [ theme.package ];
    };
  };
}
