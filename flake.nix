{
  description = "Loïc Reynier's Nix packages";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }:
    {
      overlays.default = nixpkgs.lib.composeManyExtensions [
        (final: prev: {} // import ./pkgs {pkgs = final;})
      ];
    }
    // (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [self.overlays.default];
      };
    in {
      packages = {
        fzf-obc = pkgs.fzf-obc;
        gg = pkgs.gg;
        goto = pkgs.goto;
      };
    }));
}
