{ pkgs }:

with pkgs;
{
  foxmarks = callPackage ./foxmarks { };
  gh-f = callPackage ./gh-f { };
  gh-notify = callPackage ./gh-notify { };
  goto = callPackage ./goto { };
  pinentry-wsl-ps1 = callPackage ./pinentry-wsl-ps1 { };
  pinentry-wsl-ps1-wsl2 = callPackage ./pinentry-wsl-ps1/wsl-2.nix { };
  spriggit-bin = callPackage ./spriggit-bin { };
  # win32yank = callPackage ./win32yank { }; # Can't compile on Nix/Linux
  win32yank-bin = callPackage ./win32yank/bin.nix { };
}
