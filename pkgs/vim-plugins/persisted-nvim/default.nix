{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "persisted.nvim";
  version = "2023-08-11";
  src = fetchFromGitHub {
    owner = "olimorris";
    repo = "persisted.nvim";
    rev = "315cd1a8a501ca8e0c1d55f0c245b9cc0e1ffa01";
    sha256 = "sha256-xmHNjvLooWCcOm0ewCUg4pwarbjyneb39oWjLW0rL7g=";
  };
  meta.homepage = "https://github.com/olimorris/persisted.nvim";
}
