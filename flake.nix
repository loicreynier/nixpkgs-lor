{
  description = "Loïc Reynier's Nix packages";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nixpkgs.url = "github:NixOS/nixpkgs";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    pre-commit-hooks,
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

      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = with pkgs; {
            alejandra.enable = true;
            commitizen = {
              enable = true;
              entry = "${pkgs.commitizen}/bin/cz check --commit-msg-file";
              stages = ["commit-msg"];
            };
            editorconfig-checker = {
              enable = true;
              entry = "${pkgs.editorconfig-checker}/bin/editorconfig-checker";
              types = ["file"];
            };
            prettier.enable = true;
          };
        };
      };

      devShells.default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
      };
    }));
}
