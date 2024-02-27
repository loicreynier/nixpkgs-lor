{ fetchFromGitHub
, vimUtils
,
}:
vimUtils.buildVimPlugin {
  pname = "duck-nvim";
  version = "1.0.0-unstable-2024-02-27";
  src = fetchFromGitHub {
    owner = "tamton-aquib";
    repo = "duck.nvim";
    rev = "0ca969d549f5d546ae395e163130024b51694235";
    hash = "sha256-meATA9jsIrRUAZ+5PkznR8RADAC3KbmTHaG4p0oietw=";
  };
  meta.homepage = "https://github.com/tamton-aquib/duck.nvim";
}
