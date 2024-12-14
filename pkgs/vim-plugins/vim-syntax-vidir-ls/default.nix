{ fetchFromGitHub, vimUtils }:
vimUtils.buildVimPlugin {
  pname = "vim-syntax-vidir-ls";
  version = "0-unstable-2022-04-02";
  src = fetchFromGitHub {
    owner = "trapd00r";
    repo = "vim-syntax-vidir-ls";
    rev = "f514b18288f0fb3ce28fcf7d75a207fecc2fa29b";
    hash = "sha256-e3W46NHwrmykHfb1ec0AIcC7xKhbCo9SVRZAKKiMnjs=";
  };
  meta.homepage = "https://github.com/trapd00r/vim-syntax-vidir-ls";
}
