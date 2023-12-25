{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPlugin {
  pname = "neocolumn-nvim";
  version = "2023-10-17";
  src = fetchFromGitHub {
    owner = "ecthelionvi";
    repo = "NeoColumn.nvim";
    rev = "db7695c7c70fcacd290712deef659bca464634ee";
    hash = "sha256-oiEUW9LuZ73/E+kpbYOmCDTesNFAZWs1qY9SVfIsGY0=";
  };
  meta.homepage = "https://github.com/ecthelionvi/NeoColumn.nvim";
}
