{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "src-cli";
  version = "5.1.2";
  src = fetchFromGitHub {
    owner = "sourcegraph";
    repo = "src-cli";
    rev = "${version}";
    hash = "sha256-KqCH4f9QPfr/Hm4phR9qeCV925RkOawGnbCx8wz/QwE=";
  };

  vendorHash = "sha256-NMLrBYGscZexnR43I4Ku9aqzJr38z2QAnZo0RouHFrc=";

  doCheck = false;

  meta = with lib; {
    description = "Command line interface to Sourcegraph";
    homepage = "https://github.com/sourcegraph/src-cli";
    changelog = "https://github.com/sourcegraph/src-cli/blob/${version}/CHANGELOG.md";
    maintainers = with maintainers; [ loicreynier ];
    license = licenses.asl20;
  };
}
