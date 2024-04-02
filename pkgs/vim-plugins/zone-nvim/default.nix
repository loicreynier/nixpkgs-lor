{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPlugin {
  pname = "zone-nvim";
  version = "0-unstable-2024-10-07";
  src = fetchFromGitHub {
    owner = "tamton-aquib";
    repo = "zone.nvim";
    rev = "8dc5b1277a94d6be3c2a039967cbc89cd825ba6f";
    hash = "sha256-eCIWvKJ/PEDKKFNBm4wxTFAtJ2qeogmaEz9YKDR0APA=";
  };
  meta.homepage = "https://github.com/tamton-aquib/zone.nvim";
}
