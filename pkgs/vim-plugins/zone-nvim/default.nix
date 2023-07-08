{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "zone-nvim";
  version = "2023-04-07";
  src = fetchFromGitHub {
    owner = "tamton-aquib";
    repo = "zone.nvim";
    rev = "f51c9e1097d4a77a78ff60c7649f4cbeded71b2f";
    hash = "sha256-qSOWWBUxfMr9F/xgXtNIO8uEHoMMhxUNoxZIuAakn9Q=";
  };
  meta.homepage = "https://github.com/tamton-aquib/zone.nvim";
}
