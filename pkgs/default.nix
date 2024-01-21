{ pkgs }:

with pkgs;
{
  foxmarks = callPackage ./foxmarks { };
  goto = callPackage ./goto { };
  spriggit-bin = callPackage ./spriggit-bin { };
}
