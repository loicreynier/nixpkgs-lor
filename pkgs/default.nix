{ pkgs }:

with pkgs;
{
  fzf-tab-completion = callPackage ./fzf-tab-completion { };
  goto = callPackage ./goto { };
  pinentry-wsl-ps1 = callPackage ./pinentry-wsl-ps1 { };
  pinentry-wsl-ps1-wsl2 = callPackage ./pinentry-wsl-ps1/wsl-2.nix { };
  gitversion = callPackage ./gitversion { };
  spriggit = callPackage ./spriggit { };
  # win32yank = callPackage ./win32yank { }; # Can't compile on Nix/Linux
  win32yank-bin = callPackage ./win32yank/bin.nix { };
}
