{ fetchurl, lib, makeWrapper, stdenv, unzip }:
let
  pname = "spriggit-bin";
  version = "0.14";
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com/Mutagen-Modding/Spriggit/releases/download/${version}/SpriggitLinuxCLI.zip";
    hash = "sha256-tXAaWiq8YZBGU+fuBzT4BqvLMpi/hRO5XaH2o91ZO8I=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    makeWrapper
    unzip
  ];

  installPhase = ''
    mkdir -p "$out/opt/spriggit"
    unzip -d "$out/opt/spriggit" "$src"
    chmod +x "$out/opt/spriggit/Spriggit.CLI"
    makeWrapper "$out/opt/spriggit/Spriggit.CLI" "$out/bin/spriggit" --chdir "$out/opt/spriggit"
  '';

  meta = with lib; {
    description = "Tool to facilitate converting Bethesda plugin files to a text based format that can be stored in Git";
    homepage = "https://github.com/Mutagen-Modding/Spriggit";
    license = licenses.gpl3;
    maintainers = [ maintainers.loicreynier ];
    platforms = platforms.linux;
  };

}
