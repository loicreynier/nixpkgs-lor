{ lib, fetchFromGitHub, rustPlatform, sqlite }:

rustPlatform.buildRustPackage rec {
  pname = "foxmarks";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "zer0-x";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-QoFQdlG5VHJf7BIwH5dtYsf97bfRlKRyXpoFgsqLiuo=";
  };

  cargoSha256 = "sha256-S/LnyMKp5eWG9z5shpb/kq80vytYAfuAzTDPxwdupy8=";

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
