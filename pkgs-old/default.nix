{ pkgs }:
with pkgs; {
  fira-math = callPackage ./fira-math { };
  fira-math-next = callPackage ./fira-math/next.nix { };
  gen-license = callPackage ./gen-license { };
  gh-f = callPackage ./gh-f { };
  gh-notify = callPackage ./gh-notify { };
  src-cli = callPackage ./src-cli { };
}
