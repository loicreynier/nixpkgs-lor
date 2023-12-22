{ pkgs }:

with pkgs;
{
  fira-math = callPackage ./fira-math { };
  fira-math-next = callPackage ./fira-math/next.nix { };
  foxmarks = callPackage ./foxmarks { };
  goto = callPackage ./goto { };
}
