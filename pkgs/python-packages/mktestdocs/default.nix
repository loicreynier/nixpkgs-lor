{ lib, buildPythonPackage, fetchFromGitHub, setuptools, pytestCheckHook, }:
buildPythonPackage rec {
  pname = "mktestdocs";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "koaning";
    repo = "mktestdocs";
    rev = version;
    hash = "sha256-snlt6SDiDYr04b2b2NgBC/1IBffpei034vFx3fnYUOc=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "mktestdocs" ];

  meta = with lib; {
    description = "Library to run pytest against Markdown files or docstrings";
    homepage = "https://github.com/koaning/mktestdocs";
    changelog =
      "https://github.com/koaning/mktestdocs/releases/tag/v${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ loicreynier ];
  };
}
