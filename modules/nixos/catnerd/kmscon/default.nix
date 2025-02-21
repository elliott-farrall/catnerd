{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.services.kmscon.catnerd;
  enable = cfg.enable && config.services.kmscon.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    services.kmscon.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd kmscon theme";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    services.kmscon.extraConfig = builtins.readFile (pkgs.catnerd.catppuccin-kmscon.override { inherit flavour; });
  };
}
