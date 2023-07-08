{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
}:

buildPythonPackage rec {
  pname = "winregistry";
  version = "1.1.1";
  format = "pyproject";

  meta = with lib; {
    description = "Minimal library aimed at working with Windows registry";
    homepage = "https://github.com/shpaker/winregistry";
    changelog = "https://github.com/shpaker/winregistry/releases/tag/${version}";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-lC/srTdRwbeLnmsKUgJmkDwwI/EEZozhvb84HsmTrYs=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  # No import checks since it requires `winreg`
  # pythonImportsCheck = [ winregistry ];
}
