{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "duck-nvim";
  version = "2023-07-08";
  src = fetchFromGitHub {
    owner = "tamton-aquib";
    repo = "duck.nvim";
    rev = "8f18dd79c701698fc150119ef642c1881ce6a538";
    hash = "sha256-YPZF57FsN1Zr8S2R2hKIX9xO0w8kbNs8zdLjm6hpynI=";
  };
  meta.homepage = "https://github.com/tamton-aquib/duck.nvim";
}
