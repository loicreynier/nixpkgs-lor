{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "winregistry";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NwwocvnPmlEu00QDnvriopQ+s2NVvIZzNv8Eng+dHbQ=";
  };

  build-system = [ poetry-core ];

  # No import checks since it requires `winreg`
  # pythonImportsCheck = [ winregistry ];

  meta = {
    description = "Minimal library aimed at working with Windows registry";
    homepage = "https://github.com/shpaker/winregistry";
    changelog = "https://github.com/shpaker/winregistry/releases/tag/${version}";
    license = lib.licenses.mit;
  };
}
