{ pkgs }:

with pkgs;
{
  fira-math = callPackage ./fira-math { };
  fira-math-next = callPackage ./fira-math/next.nix { };
  foxmarks = callPackage ./foxmarks { };
  gen-license = callPackage ./gen-license { };
  goto = callPackage ./goto { };
}
