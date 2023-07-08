{ pkgs }:

with pkgs;
{
  fira-math = callPackage ./fira-math { };
  foxmarks = callPackage ./foxmarks { };
  gen-license = callPackage ./gen-license { };
  goto = callPackage ./goto { };
  src-cli = callPackage ./src-cli { };
}
