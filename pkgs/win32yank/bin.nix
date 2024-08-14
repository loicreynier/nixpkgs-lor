{ stdenv, fetchzip, lib }:

stdenv.mkDerivation rec {
  pname = "win32yank-bin";
  version = "0.1.1";

  src = fetchzip {
    url =
      "https://github.com/equalsraf/win32yank/releases/download/v${version}/win32yank-x64.zip";
    hash = "sha256-4ivE1cYZhYs4ibx5oiYMOhbse9bdOomk7RjgdVl5lD0=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    install -D -m744 "win32yank.exe" "$out/bin/win32yank.exe"
  '';

  meta = with lib; {
    description = "Windows clipboard tool";
    homepage = "https://github.com/equalsraf/win32yank";
    license = licenses.isc;
    maintainers = with maintainers; [ loiceynier ];
  };
}
