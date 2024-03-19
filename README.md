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

- `foxmarks-2.0.3`: CLI read-only interface for Mozilla Firefox's bookmarks
- `goto-2.0.0`: Shell utility allowing users to navigate to aliased directories
- `pinentry-wsl-ps1-0.2-unstable-2022-09-04`: GUI for GPG within Windows Subsystem for Linux
- `pinentry-wsl-ps1-wsl2-0.2-unstable-2023-03-10`: GUI for GPG within Windows Subsystem for Linux
- `python3.11-betterbib-5.0.11`: Tool to update BibTeX files with info from online resources.
- `python3.11-dmsuite-0.3.0`: Scientific library providing a collection of spectral collocation differentiation matrices
- `python3.11-mobase-stubs-2.4.0`: Typing stubs for MO2 Python API
- `python3.11-plm-0.2.11`: Command-line tool and library that managers your Python software licenses
- `python3.11-py-machineid-0.4.6`: Library to get the unique machine ID of any host
- `python3.11-pyfomod-1.2.1`: High-level Fomod library.
- `python3.11-winregistry-1.1.1`: Minimal library aimed at working with Windows registry
- `python3.11-x21-0.4.19`
- `python3.11-xdg-open-wsl-2022-04-16`: xdg-open replacement for WSL that opens files and links using Windows apps
- `spriggit-bin-0.16`: Tool to facilitate converting Bethesda plugin files to a text based format that can be stored in Git
- `vimplugin-duck-nvim-1.0.0-unstable-2024-03-07`
- `vimplugin-zone-nvim-2023-04-07`
- `win32yank-bin-0.1.1`: Windows clipboard tool

<!-- editorconfig-checker-enable -->

The subsequent packages are no longer being maintained within this repository.
The last updated derivation of these packages
can be found in the `./pkgs-old` folder.

- `fira-math`: available in [`nixpkgs/unstable`][fira-math]
- `gen-license`: available in [`nixpkgs`][gen-license]
- `mkdnflow-nvim`: available in [`nixpkgs`][mkdnflow-nvim]
- `pdfrw2`: available in [`nixpkgs/unstable`][pdfrw2]
- `src-cli`: available in [`nixpkgs`][src-cli]

The others Neovim packages that were removed
are available in [NixNeovimPlugins].
This overlay automatically provides all plugins from [awesome-neovim].

<!-- editorconfig-checker-disable -->

[pdfrw2]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/python-modules/pdfrw2/default.nix
[fira-math]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/fi/fira-math/package.nix
[gen-license]: https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/development/tools/gen-license/default.nix
[mkdnflow-nvim]: https://github.com/NixOS/nixpkgs/blob/d65bceaee0fb1e64363f7871bc43dc1c6ecad99f/pkgs/applications/editors/vim/plugins/generated.nix#L5583
[src-cli]: https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/development/tools/misc/src-cli/default.nix
[NixNeovimPlugins]: https://github.com/NixNeovim/NixNeovimPlugins
[awesome-neovim]: https://github.com/rockerBOO/awesome-neovim

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
