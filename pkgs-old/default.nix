{ pkgs }:
with pkgs; {
  src-cli = callPackage ./src-cli { };
  gen-license = callPackage ./gen-license { };
}
