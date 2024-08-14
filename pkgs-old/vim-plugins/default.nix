{ pkgs }:

with pkgs; {
  mkdnflow-nvim = callPackage ./mkdnflow-nvim { };
  neocolumn-nvim = callPackage ./neocolumn-nvim { };
  pantran-nvim = callPackage ./pantran-nvim { };
  persisted-nvim = callPackage ./persisted-nvim { };
  neocolumn-nvim = callPackage ./neocolumn-nvim { };
  telescope-bibtex-nvim = callPackage ./telescope-bibtex-nvim { };
  vscode-nvim = callPackage ./vscode-nvim { };
}
