{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.gtk.catnerd;
  enable = cfg.enable && config.gtk.enable;

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
    gtk = {
      inherit theme;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override { inherit accent; flavor = flavour; };
      };
      cursorTheme = {
        name = "catppuccin-${flavour}-${accent}-cursors";
        package = pkgs.catppuccin-cursors.macchiatoPink;
        size = config.catnerd.cursor.size;
      };
      font = {
        name = "${config.catnerd.fonts.main.family} Nerd Font";
        package = config.catnerd.fonts.main.pkg;
        size = config.catnerd.fonts.main.size;
      };
    };

    xdg.configFile = {
      "gtk-4.0/assets".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/gtk-dark.css";
    };

    dconf.settings = lib.mkIf (builtins.elem config.catnerd.flavour [ "frappe" "macchiato" "mocha" ]) {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
