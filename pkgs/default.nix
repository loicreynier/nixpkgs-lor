{ pkgs }:

with pkgs;
{
  foxmarks = callPackage ./foxmarks { };
  goto = callPackage ./goto { };
  pinentry-wsl-ps1 = callPackage ./pinentry-wsl-ps1 { };
  pinentry-wsl-ps1-wsl2 = callPackage ./pinentry-wsl-ps1/wsl-2.nix { };
  spriggit-bin = callPackage ./spriggit-bin { };
}
