# `nixpkgs-lor`

Personal Nix package collection.

## About

This is a personal collection of Nix packages that I will pull (or have pulled)
to [`nixpkgs`][nixpkgs].
I use this Flake to install packages to my environments
until they are available on `nixpkgs` or until they are properly packaged.

[nixpkgs]: https://github.com/NixOS/nixpkgs

## Package list

- `fira-math-0.3.4`: Math font with Unicode math support based on FiraSans and FiraGO
- `foxmarks-1.0.2`: CLI read-only interface for Mozilla Firefox's bookmarks
- `gen-license-0.1.2`: Interactive command-line tool for generating license files
- `goto-2.0.0`: Shell utility allowing users to navigate to aliased directories
- `python3.10-betterbib-5.0.5`: Tool to update BibTeX files with info from online resources.
- `python3.10-dmsuite-0.3.0`: Scientific library providing a collection of spectral collocation differentiation matrices
- `python3.10-plm-0.2.2`: Command-line tool and library that managers your Python software licenses
- `python3.10-py-machineid-0.3.0`: Library to get the unique machine ID of any host
- `python3.10-winregistry-1.1.1`: Minimal library aimed at working with Windows registry
- `python3.10-x21-0.4.10`
- `python3.10-xdg-open-wsl-2022-04-16`: xdg-open replacement for WSL that opens files and links using Windows apps
- `src-cli-5.0.3`: Command line interface to Sourcegraph
- `vimplugin-mkdnflow.nvim-2023-07-05`
- `vimplugin-pantran.nvim-2023-06-05`
- `vimplugin-persisted.nvim-2023-04-24`
- `vimplugin-telescope-bibtex-nvim-2023-04-06`
- `vimplugin-vscode.nvim-2023-06-30`
- `vimplugin-zone-nvim-2023-04-07`

## Installation

The flake provides an overlay through which
you can install the packages in you environments.

```nix
pkgs = import nixpkgs {
  inherit system;
  overlays = [
    nixpkgs-lor.overlays.default.${system}
  ];
};
```
