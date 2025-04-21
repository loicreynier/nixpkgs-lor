{
  description = "Loïc Reynier's Nix packages";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      git-hooks,
    }:
    {
      overlays.default = nixpkgs.lib.composeManyExtensions [
        (
          final: prev:
          let
            # Define Python overlay to apply to any Python version
            pythonOverlay = python-final: _: { } // import ./pkgs/python-packages { python = python-final; };
            pythonPackagesOverlays = (prev.pythonPackagesOverlays or [ ]) ++ [ pythonOverlay ];
            # Helper to override a Python version
            overridePython =
              python:
              python.override {
                packageOverrides = prev.lib.composeManyExtensions pythonPackagesOverlays;
              };
          in
          {
            pythonPackagesOverlays = (prev.pythonPackagesOverlays or [ ]) ++ [
              (python-final: _: { } // import ./pkgs/python-packages { python = python-final; })
            ];
            python3 = overridePython prev.python3;
            python3Packages = final.python3.pkgs;
            python311 = overridePython prev.python311;
            python311Packages = final.python311.pkgs;
            vimPlugins = prev.vimPlugins // import ./pkgs/vim-plugins { pkgs = final; };
          }
          // import ./pkgs { pkgs = final; }
        )
      ];
    }
    // (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
          config.allowUnfreePredicate =
            pkg:
            builtins.elem (nixpkgs.lib.getName pkg) [
              "betterbib"
              "fzf-obc"
              "plm"
            ];
        };
        pythonEnv = pkgs.python3.withPackages (
          ps: with ps; [
            black
            jinja2
          ]
        );
      in
      {
        packages =
          { }
          // import ./pkgs { inherit pkgs; }
          // import ./pkgs/python-packages { python = pkgs.python3Packages; }
          // import ./pkgs/vim-plugins { inherit pkgs; };

        checks = {
          pre-commit-check = git-hooks.lib.${system}.run {
            src = ./.;

            hooks = {
              make_readme = {
                enable = true;
                name = "make-readme";
                entry = "${pythonEnv}/bin/python docs/make_readme.py";
                files = ".*\\.(nix|py|md)";
                language = "system";
                pass_filenames = false;
              };

              commitizen.enable = true;
              deadnix.enable = true;
              editorconfig-checker = {
                enable = true;
                excludes = [
                  "flake.lock"
                  "deps.nix"
                ];
              };
              nixfmt-rfc-style.enable = true;
              ruff.enable = true;
              prettier = {
                enable = true;
                excludes = [ "flake.lock" ];
              };
              statix.enable = true;
              typos = {
                enable = true;
                excludes = [ "deps.nix" ];
              };
            };
          };
        };

        devShells.default = pkgs.mkShell {
          propagatedBuildInputs = with pkgs; [
            findutils # xargs
            just
            jq
            nixfmt-rfc-style
            pythonEnv
          ];
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };
      }
    ));
}
