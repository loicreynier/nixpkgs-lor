{
  lib,
  fetchFromGitHub,
  rustPlatform,
  sqlite,
}:

rustPlatform.buildRustPackage rec {
  pname = "foxmarks";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "zer0-x";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-9IG/ZHNbMHbz/2mOAhfwuPJbQXhlG80mfHNM4e7Ng0g=";
  };

  cargoHash = "sha256-NtM5vLBum5nR8zNGMAykzt258avXkuO4XR3z6KCnjYA=";

  buildInputs = [ sqlite ];

  meta = {
    description = "CLI read-only interface for Mozilla Firefox's bookmarks";
    homepage = "https://github.com/zer0-x/foxmarks";
    changelog = "https://github.com/zer0-x/foxmarks/blobl/v${version}/CHANGELOG.md";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ loicreynier ];
  };
}
