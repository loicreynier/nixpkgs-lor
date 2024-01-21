{ pkgs }:
with pkgs; {
  fira-math = callPackage ./fira-math { };
  fira-math-next = callPackage ./fira-math/next.nix { };
  src-cli = callPackage ./src-cli { };
  gen-license = callPackage ./gen-license { };
}
