{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "win32yank";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "equalsraf";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-JiPuev7Mr+xzH90HMiV7n7je0cKZQf2PcHcSgPVlT4w=";
  };

  cargoHash = "sha256-maQkXf10utUhHvM4pnNfp8qHW5jgyMaX/d7xo/+Nbos=";

  cargoPatches = [
    ./add-cargo-lock.patch
  ];

  meta = with lib; {
    description = "Windows clipboard tool";
    homepage = "https://github.com/equalsraf/win32yank";
    license = licenses.isc;
    maintainer = with maintainers; [ loicreynier ];
  };
}
