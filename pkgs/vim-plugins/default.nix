{ pkgs }:

with pkgs;
{
  duck-nvim = callPackage ./duck-nvim { };
  pantran-nvim = callPackage ./pantran-nvim { };
  persisted-nvim = callPackage ./persisted-nvim { };
  neocolumn-nvim = callPackage ./neocolumn-nvim { };
  telescope-bibtex-nvim = callPackage ./telescope-bibtex-nvim { };
  vscode-nvim = callPackage ./vscode-nvim { };
  zone-nvim = callPackage ./zone-nvim { };
}
