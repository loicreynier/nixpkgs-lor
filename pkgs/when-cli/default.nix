{ lib, fetchCrate, rustPlatform }:
rustPlatform.buildRustPackage rec {

  pname = "when-cli";
  version = "0.4.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-LWssrLl2HKul24N3bJdf2ePqeR4PCROrTiVY5sqzB2M=";
  };

  cargoHash = "sha256-9emY0yhAKVzuk1Tlzi0kW8oR9jRqLdg8wbTcJMBrxMw=";

  meta = with lib; {

    description = "Command line tool for converting between timezones";
    homepage = "https://github.com/mitsuhiko/when";
    licenses = licenses.asl20;
    maintainers = with maintainers; [ loicreynier ];
  };

}
