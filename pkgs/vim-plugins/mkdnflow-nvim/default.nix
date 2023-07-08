{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "mkdnflow.nvim";
  version = "2023-07-05";
  src = fetchFromGitHub {
    owner = "jakewvincent";
    repo = "mkdnflow.nvim";
    rev = "a728a3533bb57502fdfd6fdb4e5839fc87430edc";
    hash = "sha256-U6YiUxt1TikKCD2YKLzcG9KR0c5p716xRFmNk2Tk/6M=";
  };
  meta.homepage = "https://github.com/jakewvincent/mkdnflow.nvim";
}
