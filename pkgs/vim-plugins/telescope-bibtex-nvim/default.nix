{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix rec {
  pname = "telescope-bibtex-nvim";
  version = "2023-04-06";
  src = fetchFromGitHub {
    owner = "nvim-telescope";
    repo = "telescope-bibtex.nvim";
    rev = "0b01f5c457f208ff2e12ce4dae89a61eec1ed69d";
    hash = "sha256-c1HwWQlmrtb6TYFU3pp51qpXQ8ah5oRz2htcGhMi37s=";
  };
  meta.homepage = "https://github.com/nvim-telescope/telescope-bibtex.nvim";
}
