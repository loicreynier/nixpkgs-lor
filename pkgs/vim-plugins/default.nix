{ pkgs }:

with pkgs;
{
  duck-nvim = callPackage ./duck-nvim { };
  zone-nvim = callPackage ./zone-nvim { };
}
