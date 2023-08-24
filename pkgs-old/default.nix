{ pkgs }:
with pkgs; {
  src-cli = callPackage ./src-cli { };
}
