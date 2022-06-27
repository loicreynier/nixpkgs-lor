{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkgconfig,
  openssl,
}:
rustPlatform.buildRustPackage rec {
  pname = "gg";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "thecasualcoder";
    repo = pname;
    rev = version;
    sha256 = "sha256-DaU1qN5a9RA7Pxw40CR5m7CDEce8pfmD3Mbr/Xgc6u0=";
  };

  cargoSha256 = "sha256-a/8h+uYoDIUZKMFuvgDPPDuvrdAwRC1fYrcZfe/CamM=";

  nativeBuildInputs = [pkgconfig];
  buildInputs = [openssl];

  meta = with lib; {
    description = "A tool to manage multiple Git repositories";
    license = licenses.mit;
    maintainers = [maintainers.loicreynier];
  };
}
