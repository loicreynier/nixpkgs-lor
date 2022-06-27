{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "fzf-obc";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "rockandska";
    repo = pname;
    rev = version;
    sha256 = "sha256-KIAlDpt1Udl+RLp3728utgQ9FCjZz/OyoG92MOJmgPI=";
  };

  outputs = ["out"];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/opt/${pname}/{bin,lib/${pname},plugins/{kill,gradle}}
    install -m644 bin/* $out/opt/${pname}/bin
    install -m644 lib/${pname}/* $out/opt/${pname}/lib/${pname}
    install -m644 plugins/kill/* $out/opt/${pname}/plugins/kill
    install -m644 plugins/gradle/* $out/opt/${pname}/plugins/gradle
  '';
}
