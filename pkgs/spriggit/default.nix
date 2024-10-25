{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
  git,
  icu,
}:
buildDotnetModule rec {
  pname = "spriggit-cli";
  version = "0.35";
  src = fetchFromGitHub {
    owner = "Mutagen-Modding";
    repo = "Spriggit";
    rev = version;
    hash = "sha256-nt0f1aAdXewtuHqvTrhOHF0oRN4YglPcdNlmGUr+wY4=";
  };

  projectFile = "Spriggit.CLI/Spriggit.CLI.csproj";
  nugetDeps = ./deps.nix; # To update: `nix build .#spriggit.passthru.fetch-deps && ./result pkgs/spriggit/deps.nix`
  dotnet-sdk = with dotnetCorePackages; combinePackages [ sdk_8_0 ];
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  runtimeDeps = [ icu ];
  executables = [ "Spriggit.CLI" ];

  nativeBuildInputs = [ git ];

  meta = {
    description = "Tool to facilitate converting Bethesda plugin files to a text based format that can be stored in Git";
    homepage = "https://github.com/Mutagen-Modding/Spriggit";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ loicreynier ];
    platforms = lib.platforms.linux;
  };
}
