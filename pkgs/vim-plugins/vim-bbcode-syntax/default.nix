{ fetchFromGitHub, vimUtils }:
vimUtils.buildVimPlugin rec {
  pname = "vim-bbcode-syntax";
  version = "0.2";
  src = fetchFromGitHub {
    owner = "vim-scripts";
    repo = "bbcode";
    rev = version;
    hash = "sha256-ZnRFs04MI3CxdwyQ8eUCSYoPrWlIWImoJEicqiBPPPQ=";
  };
  meta.homepage = "https://github.com/vim-scripts/bbcode";
}
