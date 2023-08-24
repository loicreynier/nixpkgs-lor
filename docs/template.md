# `nixpkgs-lor`

Personal Nix package collection.

## About

This is a personal collection of Nix packages that
I will pull (or have pulled) to [`nixpkgs`][nixpkgs].
I use this Flake to install packages to my environments
until they are available on `nixpkgs` or until they are properly packaged.

[nixpkgs]: https://github.com/NixOS/nixpkgs

## Package list

{{package_list}}

The subsequent packages are no longer being maintained within this repository.
The last updated derivation of these packages
can be found in the `./pkgs-old` folder.

- `src-cli`: available in [`nixpkgs/unstable`][src-cli]

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

[src-cli]: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/misc/src-cli/default.nix
