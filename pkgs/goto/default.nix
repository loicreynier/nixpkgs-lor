{ stdenv, fetchFromGitHub, lib }:

stdenv.mkDerivation rec {
  pname = "goto";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "iridakos";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-7/fEa5jXKbTwzyHhvpp8yuoo70DdlX1AxidYuc1PjV0=";
  };

  patchFlags = [ "-F3" ];

  patches = [
    ./replace-mv-by-command-mv.patch
    ./dont-touch-db.patch
  ];

  outputs = [ "out" ];

  dontBuild = true;

  installPhase = ''
    install -Dm644 goto.sh $out/share/${pname}/goto.sh
  '';

  meta = with lib; {
    description = "Shell utility allowing users to navigate to aliased directories";
    homepage = "https://github.com/iridakos/goto";
    changelog = "https://github.com/iridakos/goto/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = [ maintainers.loicreynier ];
  };
}
