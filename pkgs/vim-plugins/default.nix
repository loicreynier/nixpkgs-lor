{ pkgs }:

with pkgs;
{
  duck-nvim = callPackage ./duck-nvim { };
  mkdnflow-nvim = callPackage ./mkdnflow-nvim { };
  pantran-nvim = callPackage ./pantran-nvim { };
  persisted-nvim = callPackage ./persisted-nvim { };
  telescope-bibtex-nvim = callPackage ./telescope-bibtex-nvim { };
  vscode-nvim = callPackage ./vscode-nvim { };
  zone-nvim = callPackage ./zone-nvim { };
}
