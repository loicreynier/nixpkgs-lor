{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPlugin rec {
  pname = "duck-nvim";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "tamton-aquib";
    repo = "duck.nvim";
    rev = "v${version}";
    hash = "sha256-G3n3viqsqlZ4Lo3jQY7cfEw7DmCKTCoxL4mvBBujOP0=";
  };
  meta.homepage = "https://github.com/tamton-aquib/duck.nvim";
}
