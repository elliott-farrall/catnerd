{ lib
, stdenv

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation {
  pname = "catppuccin-kmscon";
  version = "1.0.0";

  dontUnpack = true;

  installPhase =
    let
      getColour = name: builtins.concatStringsSep ", " (builtins.map builtins.toString (lib.nix-colors.conversions.hexToRGB (lib.catnerd.mkColour lib.catnerd.colours.${flavour}.${name})));
    in
    ''
      echo 'palette=custom' > $out
      echo 'palette-black=${getColour "crust"}' >> $out
      echo 'palette-red=${getColour "red"}' >> $out
      echo 'palette-green=${getColour "green"}' >> $out
      echo 'palette-yellow=${getColour "yellow"}' >> $out
      echo 'palette-blue=${getColour "blue"}' >> $out
      echo 'palette-magenta=${getColour "mauve"}' >> $out
      echo 'palette-cyan=${getColour "sky"}' >> $out
      echo 'palette-light-grey=${getColour "overlay2"}' >> $out
      echo 'palette-dark-grey=${getColour "overlay0"}' >> $out
      echo 'palette-light-red=${getColour "maroon"}' >> $out
      echo 'palette-light-green=${getColour "teal"}' >> $out
      echo 'palette-light-yellow=${getColour "yellow"}' >> $out
      echo 'palette-light-blue=${getColour "sapphire"}' >> $out
      echo 'palette-light-magenta=${getColour "pink"}' >> $out
      echo 'palette-light-cyan=${getColour "sky"}' >> $out
      echo 'palette-white=${getColour "text"}' >> $out
      echo 'palette-foreground=${getColour "text"}' >> $out
      echo 'palette-background=${getColour "base"}' >> $out
    '';
}
