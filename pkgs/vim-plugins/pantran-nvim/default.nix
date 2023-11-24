{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPlugin {
  pname = "pantran-nvim";
  version = "2023-06-05";
  src = fetchFromGitHub {
    owner = "potamides";
    repo = "pantran.nvim";
    rev = "42c4c1fba7cc86315e1f33eb2d31d99f7e96a9f6";
    hash = "sha256-nDDMX6RY8Dq14JshsaOaI+BWldadlhlpIOwiNhm4ai8=";
  };
  meta.homepage = "https://github.com/potamides/pantran.nvim";
}
