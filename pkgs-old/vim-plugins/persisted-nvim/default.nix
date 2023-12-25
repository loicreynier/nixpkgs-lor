{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPlugin {
  pname = "persisted.nvim";
  version = "2023-11-26";
  src = fetchFromGitHub {
    owner = "olimorris";
    repo = "persisted.nvim";
    rev = "fc9f398393cc3bb0e4e81cb9f7c133cd2b21467f";
    hash = "sha256-x/Em3BsiOgNVcmeEBbRPWI3SfxZ7VMZKrTJtUhHuzrI=";
  };
  meta.homepage = "https://github.com/olimorris/persisted.nvim";
}
