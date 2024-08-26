{ lib, buildDotnetModule, fetchFromGitHub, dotnetCorePackages, git, icu }:
buildDotnetModule rec {
  pname = "spriggit-cli";
  version = "0.26";
  src = fetchFromGitHub {
    owner = "Mutagen-Modding";
    repo = "Spriggit";
    rev = version;
    hash = "sha256-Wk0cJoryNk916Q9EgAxz4+4dqLmfss3C0A4cyb9FNqo=";
  };

  projectFile = "Spriggit.CLI/Spriggit.CLI.csproj";
  nugetDeps =
    ./deps.nix; # To update: `nix build .#spriggit.passthru.fetch-deps && ./result pkgs/spriggit/deps.nix`
  dotnet-sdk = with dotnetCorePackages; combinePackages [ sdk_7_0 sdk_8_0 ];
  dotnet-runtime = dotnetCorePackages.runtime_7_0;
  runtimeDeps = [ icu ];
  executables = [ "Spriggit.CLI" ];

  nativeBuildInputs = [ git ];

  meta = with lib; {
    description =
      "Tool to facilitate converting Bethesda plugin files to a text based format that can be stored in Git";
    homepage = "https://github.com/Mutagen-Modding/Spriggit";
    license = licenses.gpl3;
    maintainers = [ maintainers.loicreynier ];
    platforms = platforms.linux;
  };
}
