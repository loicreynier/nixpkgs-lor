{ fetchFromGitHub, vimUtils }:
vimUtils.buildVimPlugin {
  pname = "syntax-gaslighting.nvim";
  version = "0-unstable-2025-03-08";
  src = fetchFromGitHub {
    owner = "NotAShelf";
    repo = "syntax-gaslighting.nvim";
    rev = "a9fea11133e7bf00575e540e97a776b8677cb76c";
    hash = "sha256-k+HSFYn3stgs0IoCQnJPIpkig8EPtHMAdjdkLyckUOo=";
  };
  meta.homepage = "https://github.com/NotAShelf/syntax-gaslighting.nvim";
}
