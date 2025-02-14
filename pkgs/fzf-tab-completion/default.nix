{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "fzf-tab-completion";
  version = "0-unstable-2025-01-20";

  src = fetchFromGitHub {
    owner = "lincheney";
    repo = pname;
    rev = "4850357beac6f8e37b66bd78ccf90008ea3de40b";
    hash = "sha256-pgcrRRbZaLoChVPeOvw4jjdDCokUK1ew0Wfy42bXfQo=";
  };

  dontBuild = true;

  installPhase = ''
    install -d $out/share/fzf-tab-completion/{bash,zsh}
    install -m 644 bash/* $out/share/fzf-tab-completion/bash
    install -m 644 zsh/* $out/share/fzf-tab-completion/zsh
  '';

  meta = with lib; {
    homepage = "https://github.com/lincheney/fzf-tab-completion";
    description = "Tab completion using fzf for Bash, zsh and readline applications";
    license = licenses.gpl3;
    maintainers = with maintainers; [ loicreynier ];
  };
}
