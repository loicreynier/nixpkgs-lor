{ lib, fetchFromGitHub, rustPlatform, sqlite }:

rustPlatform.buildRustPackage rec {
  pname = "foxmarks";
  version = "2.0.0beta.0";

  src = fetchFromGitHub {
    owner = "zer0-x";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-HWhsEljMs0qhA6nmCvz59Ub3PRZzKAUzCuRxpVPr8J0=";
  };

  cargoSha256 = "sha256-hDfTEHDxzPpjSQWCHNKEiD+KXcHhiesv2qMTntPC09Q=";

  buildInputs = [
    sqlite
  ];

  meta = with lib; {
    description = "CLI read-only interface for Mozilla Firefox's bookmarks";
    homepage = "https://github.com/zer0-x/foxmarks";
    changelog = "https://github.com/zer0-x/foxmarks/blobl/v${version}/CHANGELOG.md";
    license = licenses.gpl3;
  };
}
