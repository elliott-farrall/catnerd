{ osConfig ? null
, config
, lib
, ...
}:

let
  cfg = config.catnerd;
  inherit (cfg) enable;
in
{
  imports = [
    ../../catnerd.nix

    ./alacritty
    ./cursor
    ./foot
    ./gtk
    ./hyprland
    ./hyprlock
    ./kitty
    ./qt
    ./rofi
    ./starship
    ./swaync
    ./waybar
    ./wezterm
    ./xresources
    ./zsh-syntax-highlighting
  ];

  config = lib.mkIf enable {
    assertions = [
      (lib.mkIf (osConfig != null) {
        assertion = osConfig.programs.dconf.enable;
        message = "CatNerd requires dconf to be enabled in OS";
      })
    ];
  };
}
