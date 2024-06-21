{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
}:

buildPythonPackage rec {
  pname = "winregistry";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lC/srTdRwbeLnmsKUgJmkDwwI/EEZozhvb84HsmTrYs=";
  };

  build-system = [
    poetry-core
  ];

  # No import checks since it requires `winreg`
  # pythonImportsCheck = [ winregistry ];

  meta = with lib; {
    description = "Minimal library aimed at working with Windows registry";
    homepage = "https://github.com/shpaker/winregistry";
    changelog = "https://github.com/shpaker/winregistry/releases/tag/${version}";
    license = licenses.mit;
  };
}
