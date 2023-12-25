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

{{package_list}}

<!-- editorconfig-checker-enable -->

The subsequent packages are no longer being maintained within this repository.
The last updated derivation of these packages
can be found in the `./pkgs-old` folder.

- `gen-license`: available in [`nixpkgs/unstable`][gen-license]
- `mkdnflow-nvim`: available in [`nixpkgs`][mkdnflow-nvim]
- `src-cli`: available in [`nixpkgs`][src-cli]

The others Neovim packages that were removed
are available in [NixNeovimPlugins].
This overlay automatically provides all plugins from [awesome-neovim].

<!-- editorconfig-checker-disable -->

[gen-license]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/gen-license/default.nix
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
