{ inputs
, lib
, pkgs
}:

let
  inherit (import (inputs.nixpkgs + "/nixos/lib") { }) runTest;
  args = {
    inherit pkgs;
    lib = lib.nixpkgs.extend (_: _: { inherit (lib) catnerd; } // lib.home-manager);
  };
  stateVersion = "23.11";

  catnerd.enable = true;
in
runTest {
  name = "catnerd";
  hostPkgs = pkgs;
  node.specialArgs = args;

  nodes.machine = {
    home-manager.extraSpecialArgs = args;

    imports = with inputs; [
      home-manager.nixosModules.home-manager
      self.nixosModules.catnerd
      ./nixos.nix
    ];
    system = { inherit stateVersion; };
    inherit catnerd;

    users.users.test.isNormalUser = true;
    home-manager.users.test = {
      imports = with inputs; [
        self.homeModules.catnerd
        ./home.nix
      ];
      home = { inherit stateVersion; };
      inherit catnerd;
    };
  };

  testScript = ''
    machine.start()
    machine.wait_for_unit("default.target")
  '';
}
