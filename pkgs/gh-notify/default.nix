{ lib
, fetchFromGitHub
, stdenvNoCC
, makeWrapper
, fzf
, python3
}:

stdenvNoCC.mkDerivation {
  pname = "gh-notify";
  version = "0-unstable-2024-03-19";

  src = fetchFromGitHub {
    owner = "meiji163";
    repo = "gh-notify";
    rev = "0d8fa377d79cfef0f66d2f03a5921a5e598e6807";
    hash = "sha256-Ao6gUtgW7enVlWBQhlQDc8ZW/gP90atc2F4rDNUnjj8=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''
    install -D -m755 "gh-notify" "$out/bin/gh-notify"
  '';

  postInstall = ''
    wrapProgram "$out/bin/gh-notify" --prefix PATH : "${lib.makeBinPath [ fzf python3 ]}"
  '';

  meta = with lib; {
    homepage = "https://github.com/meiji163/gh-notify";
    description = "GitHub CLI extension to display GitHub notifications";
    maintainers = with maintainers; [ loicreynier ];
    license = licenses.unlicense;
    mainProgram = "gh-notify";
    platforms = platforms.all;
  };
}
