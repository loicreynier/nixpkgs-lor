{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "persisted.nvim";
  version = "2023-04-24";
  src = fetchFromGitHub {
    owner = "olimorris";
    repo = "persisted.nvim";
    rev = "304a3c55514df408781c965d2b5aae21c34857fb";
    sha256 = "sha256-7U1uQn7hjh5mZXd5VVzxgwAB0wbiMxJ36bkBcrR+upk=";
  };
  meta.homepage = "https://github.com/olimorris/persisted.nvim";
}
