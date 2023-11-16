{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix rec {
  pname = "telescope-bibtex-nvim";
  version = "2023-11-16";
  src = fetchFromGitHub {
    owner = "nvim-telescope";
    repo = "telescope-bibtex.nvim";
    rev = "c6aeb4889ed76bcd90fbc42d294cb0b675b81439";
    hash = "sha256-9gkJjAYIo8XYzKokiyvHGrVYoz5mUxd113Yoz8kgtdQ=";
  };
  meta.homepage = "https://github.com/nvim-telescope/telescope-bibtex.nvim";
}
