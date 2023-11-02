{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "gen-license";
  version = "0.1.2";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-YZcycLQ436cjr2YTT7TEyMdeLTOl9oEfa5x3lgnnYyo=";
  };

  cargoSha256 = "sha256-2PT20eoXxBPhGsmHlEEGE2ZDyhyrD7tFdwnn3khjKNo=";

  meta = with lib; {
    description = "Interactive command-line tool for generating license files";
    homepage = "https://github.com/nexxeln/license-generator";
    changelog = "https://github.com/nexxeln/license-generator/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ loicreynier ];
  };
}
