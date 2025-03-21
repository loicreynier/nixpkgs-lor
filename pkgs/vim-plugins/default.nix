{ pkgs }:

with pkgs;
{
  duck-nvim = callPackage ./duck-nvim { };
  git-rebase-auto-diff-nvim = callPackage ./git-rebase-auto-diff-nvim { };
  syntax-gaslighting-nvim = callPackage ./syntax-gaslighting-nvim { };
  zone-nvim = callPackage ./zone-nvim { };
  vim-bbcode-syntax = callPackage ./vim-bbcode-syntax/default.nix { };
  vim-syntax-vidir-ls = callPackage ./vim-syntax-vidir-ls { };
}
