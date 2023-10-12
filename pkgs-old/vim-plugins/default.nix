{ pkgs }:

with pkgs;
{
  mkdnflow-nvim = callPackage ./mkdnflow-nvim { };
}
