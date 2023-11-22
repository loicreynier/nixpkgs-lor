# `nixpkgs-lor`

Personal Nix package collection.

## About

This is a personal collection of Nix packages that
I will pull (or have pulled) to [`nixpkgs`][nixpkgs].
I use this Flake to install packages to my environments
until they are available on `nixpkgs` or until they are properly packaged.

[nixpkgs]: https://github.com/NixOS/nixpkgs

## Package list

<!-- editorconfig-checker-disable -->

- `fira-math-0.3.4`: Math font with Unicode math support based on FiraSans and FiraGO
- `foxmarks-2.0.0beta.0`: CLI read-only interface for Mozilla Firefox's bookmarks
- `gen-license-0.1.2`: Interactive command-line tool for generating license files
- `goto-2.0.0`: Shell utility allowing users to navigate to aliased directories
- `python3.11-betterbib-5.0.11`: Tool to update BibTeX files with info from online resources.
- `python3.11-dmsuite-0.3.0`: Scientific library providing a collection of spectral collocation differentiation matrices
- `python3.11-pdfrw2-0.5.0`: Pure Python library that reads and writes PDFs
- `python3.11-plm-0.2.11`: Command-line tool and library that managers your Python software licenses
- `python3.11-py-machineid-0.4.6`: Library to get the unique machine ID of any host
- `python3.11-winregistry-1.1.1`: Minimal library aimed at working with Windows registry
- `python3.11-x21-0.4.19`
- `python3.11-xdg-open-wsl-2022-04-16`: xdg-open replacement for WSL that opens files and links using Windows apps
- `vimplugin-duck-nvim-2023-07-08`
- `vimplugin-neocolumn-nvim-2023-10-17`
- `vimplugin-pantran-nvim-2023-06-05`
- `vimplugin-persisted.nvim-2023-08-11`
- `vimplugin-telescope-bibtex-nvim-2023-11-16`
- `vimplugin-vscode-nvim-2023-10-17`
- `vimplugin-zone-nvim-2023-04-07`

<!-- editorconfig-checker-enable -->

The subsequent packages are no longer being maintained within this repository.
The last updated derivation of these packages
can be found in the `./pkgs-old` folder.

- `src-cli`: available in [`nixpkgs/unstable`][src-cli]
- `mkdnflow-nvim`: available in [`nixpkgs/unstable`][mkdnflow-nvim]

<!-- editorconfig-checker-disable -->

[src-cli]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/misc/src-cli/default.nix
[mkdnflow-nvim]: https://github.com/NixOS/nixpkgs/blob/5e4c2ada4fcd54b99d56d7bd62f384511a7e2593/pkgs/applications/editors/vim/plugins/generated.nix#L5570

<!-- editorconfig-checker-enable -->

## Installation

The flake provides an overlay through which
you can install the packages in your environments.

```nix
pkgs = import nixpkgs {
  inherit system;
  overlays = [
    nixpkgs-lor.overlays.default.${system}
  ];
};
```
