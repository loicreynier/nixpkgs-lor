{ lib
, fetchFromGitHub
, gnugrep
, iproute2
, makeWrapper
, stdenv
}:
stdenv.mkDerivation {
  pname = "pinentry-wsl-ps1";
  version = "0.2-unstable-2022-09-04";

  src = fetchFromGitHub {
    owner = "andsens";
    repo = "pinentry-wsl-ps1";
    rev = "17c1bbb564c79ddc991032383139483e98faf06b";
    hash = "sha256-xiiHosD1mICAz8knfNZv4n77nma4EPnDJ0VCsG+uX/8=";
  };

  nativeBuildInputs = [ makeWrapper ];

  propagatedBuildInputs = [
    gnugrep
    iproute2
  ];

  installPhase = ''
    src="pinentry-wsl-ps1.sh"
    dest="$out/bin/pinentry-wsl-ps1"
    install -D -m+x "$src" "$dest"
    patchShebangs "$dest"
    # wrapProgram "$dest" \
    #   --prefix PATH : /mnt/c/Windows/System32/WindowsPowerShell/v1.0
  '';

  meta = with lib; {
    description = "GUI for GPG within Windows Subsystem for Linux";
    homepage = "https://github.com/diablodale/pinentry-wsl-ps1";
    license = licenses.mpl20;
    maintainers = [ maintainers.loicreynier ];
  };
}
