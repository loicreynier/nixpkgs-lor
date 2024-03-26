{ pkgs }:

with pkgs;
{
  foxmarks = callPackage ./foxmarks { };
  goto = callPackage ./goto { };
  gh-notify = callPackage ./gh-notify { };
  pinentry-wsl-ps1 = callPackage ./pinentry-wsl-ps1 { };
  pinentry-wsl-ps1-wsl2 = callPackage ./pinentry-wsl-ps1/wsl-2.nix { };
  spriggit-bin = callPackage ./spriggit-bin { };
  # win32yank = callPackage ./win32yank { }; # Can't compile on Nix/Linux
  win32yank-bin = callPackage ./win32yank/bin.nix { };
}
