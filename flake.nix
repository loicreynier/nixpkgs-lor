{
  description = "Loïc Reynier's Nix packages";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
        (final: prev:
          {
            pythonPackagesOverlays =
              (prev.pythonPackagesOverlays or [])
              ++ [
                (python-final: _:
                  {}
                  // import ./pkgs/python-packages {python = python-final;})
              ];
            python3 = let
              self = prev.python3.override {
                inherit self;
                packageOverrides =
                  prev.lib.composeManyExtensions final.pythonPackagesOverlays;
              };
            in
              self;
            python3Packages = final.python3.pkgs;
            vimPlugins = prev.vimPlugins // import ./pkgs/vim-plugins {pkgs = final;};
          }
          // import ./pkgs {pkgs = final;})
      ];
    }
    // (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [self.overlays.default];
        config.allowUnfreePredicate = pkg:
          builtins.elem (nixpkgs.lib.getName pkg) [
            "betterbib"
            "fzf-obc"
            "plm"
          ];
      };
      pythonEnv = pkgs.python3.withPackages (ps:
        with ps; [
          black
          jinja2
        ]);
    in {
      packages =
        {}
        // import ./pkgs {inherit pkgs;}
        // import ./pkgs/python-packages {python = pkgs.python3Packages;}
        // import ./pkgs/vim-plugins {inherit pkgs;};

      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;

          hooks = with pkgs; {
            make_readme = {
              enable = true;
              name = "make-readme";
              entry = "${pythonEnv}/bin/python docs/make_readme.py";
              files = ".*\\.(nix|py|md)";
              language = "system";
              pass_filenames = false;
            };

            alejandra = {
              enable = true;
              excludes = ["pkgs/"];
            };
            black.enable = true;
            commitizen.enable = true;
            deadnix.enable = true;
            editorconfig-checker.enable = true;
            nixpkgs-fmt = {
              enable = true;
              excludes = ["flake\.nix"];
            };
            ruff.enable = true;
            prettier.enable = true;
            statix.enable = true;
            typos.enable = true;
          };
        };
      };

      devShells.default = pkgs.mkShell {
        propagatedBuildInputs = with pkgs; [
          findutils # xargs
          just
          jq
          ruff
          pythonEnv
        ];
        inherit (self.checks.${system}.pre-commit-check) shellHook;
      };
    }));
}
