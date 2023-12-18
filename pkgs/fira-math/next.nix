{ fetchFromGitHub, fira-math, python3 }:

fira-math.overrideAttrs (oldAttrs: {
  pname = oldAttrs.pname + "-next";
  version = "unstable-2023-10-09";

  src = fetchFromGitHub {
    owner = "firamath";
    repo = "firamath";
    rev = "4bd85bc943eb6a194cfc090f7e194aa27d8f8419";
    hash = "sha256-1skakzdvzf7nX2un7b9aCSj1pzBAQuueZEU7B1nARa4=";
  };

  dontUnpack = false;

  buildInputs = [
    (python3.withPackages (ps: with ps; [
      fontmake
      fonttools
      glyphslib
      toml
    ]))
  ];

  buildPhase = ''
    python scripts/build.py
  '';

  installPhase = ''
    install -D "build/FiraMath-Regular.otf" -t "$out/share/fonts/opentype/"
  '';
})
