{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  pythonOlder,
  lxml,
  looseversion,
}:
buildPythonPackage rec {
  pname = "pyfomod";
  version = "1.2.1";
  pyproject = true;
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/W2hT7db4qEMm+kkYmep9b8y1vcuLL/k0M8s3qeVUj8=";
  };

  build-system = [ poetry-core ];

  patches = [
    ./update-pyproject.patch
    ./python-312-distutils-looseversion.patch
  ];

  dependencies = [
    lxml
    looseversion
  ];

  # Tests are not uploaded to PyPi. TODO: fetch from GitHub
  # nativeCheckInputs = [
  #   pytestCheckHook
  # ];

  pythonImportsCheck = [ "pyfomod" ];

  meta = {
    description = "High-level Fomod library";
    homepage = "https://pyfomod.readthedocs.io";
    changelog = "https://github.com/GandaG/pyfomod/blob/master/CHANGELOG.md";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ loicreynier ];
  };
}
