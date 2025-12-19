# `nixpkgs-lor`

Personal Nix package collection.

## About

This is a personal collection of Nix packages that
I will pull (or have pulled) to [`nixpkgs`][nixpkgs].
I use this Flake to install packages in my environments
until they are available in `nixpkgs` or until they are properly packaged.

[nixpkgs]: https://github.com/NixOS/nixpkgs

## Package list

<!-- editorconfig-checker-disable -->

- `dotnet-gitversion-5.12.0`: From git log to SemVer in no time
- `fzf-tab-completion-0-unstable-2025-01-20`: Tab completion using fzf for Bash, zsh and readline applications
- `goto-2.1.0`: Shell utility allowing users to navigate to aliased directories
- `pinentry-wsl-ps1-0.2-unstable-2022-09-04`: GUI for GPG within Windows Subsystem for Linux
- `pinentry-wsl-ps1-wsl2-0.2-unstable-2023-03-10`: GUI for GPG within Windows Subsystem for Linux
- `python3.13-betterbib-7.5.16`: Tool to update BibTeX files with info from online resources
- `python3.13-dmsuite-0.3.0`: Scientific library providing a collection of spectral collocation differentiation matrices
- `python3.13-mobase-stubs-2.4.0`: Typing stubs for MO2 Python API
- `python3.13-plm-0.2.11`: Command-line tool and library that managers your Python software licenses
- `python3.13-pyfomod-1.2.1`: High-level Fomod library
- `python3.13-slmd-0.1.5`: CLI tool to sort lists in Markdown files
- `python3.13-winregistry-2.1.0`: Minimal library aimed at working with Windows registry
- `python3.13-x21-0.5.1`
- `python3.13-xdg-open-wsl-2022-04-16`: xdg-open replacement for WSL that opens files and links using Windows apps
- `spriggit-cli-0.35.1`: Tool to facilitate converting Bethesda plugin files to a text based format that can be stored in Git
- `vimplugin-duck.nvim-1.0.0-unstable-2024-03-07`
- `vimplugin-git-rebase-auto-diff.nvim-0-unstable-2023-05-24`
- `vimplugin-syntax-gaslighting.nvim-0-unstable-2025-03-08`
- `vimplugin-vim-bbcode-syntax-0.2`
- `vimplugin-vim-syntax-vidir-ls-0-unstable-2022-04-02`
- `vimplugin-zone-nvim-0-unstable-2024-10-07`
- `win32yank-bin-0.1.1`: Windows clipboard tool

<!-- editorconfig-checker-enable -->

The subsequent packages are no longer being maintained within this repository.

- `fira-math`: available in [`nixpkgs`][fira-math]
- `foxmarks`: available in [`nixpkgs/master`][foxmarks]
- `gen-license`: available in [`nixpkgs`][gen-license]
- `gh-f`: available in [`nixpkgs`][gh-f]
- `gh-notify`: available in [`nixpkgs`][gh-notify]
- `mkdnflow-nvim`: available in [`nixpkgs`][mkdnflow-nvim]
- `pdfrw2`: available in [`nixpkgs`][pdfrw2]
- `py-machineid`: available in [`nixpkgs/unstable`][py-machineid]
- `src-cli`: available in [`nixpkgs`][src-cli]
- `when-cli`: available in [`nixpkgs/unstable`][when-cli]

The others Neovim packages that were removed
are available in [NixNeovimPlugins].
This overlay automatically provides all plugins from [awesome-neovim].

<!-- editorconfig-checker-disable -->

[pdfrw2]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/development/python-modules/pdfrw2/default.nix
[fira-math]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/by-name/fi/fira-math/package.nix
[foxmarks]: https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/fo/foxmarks/package.nix
[gen-license]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/development/tools/gen-license/default.nix
[gh-f]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/by-name/gh/gh-f/package.nix
[gh-notify]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/by-name/gh/gh-notify/package.nix
[mkdnflow-nvim]: https://github.com/NixOS/nixpkgs/blob/d65bceaee0fb1e64363f7871bc43dc1c6ecad99f/pkgs/applications/editors/vim/plugins/generated.nix#L5583
[py-machineid]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/python-modules/py-machineid/default.nix
[src-cli]: https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/development/tools/misc/src-cli/default.nix
[when-cli]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/wh/when-cli/package.nix
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
