{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, pythonOlder
  # , pytestCheckHook
, lxml
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

  patchPhase = ''
    substituteInPlace pyproject.toml \
      --replace-fail "poetry>=0.12" "poetry-core" \
      --replace-fail "poetry.masonry" "poetry.core.masonry" \
      --replace-fail 'lxml = "^4"' 'lxml = ">=4.0"'
  '';

  build-system = [
    poetry-core
  ];

  dependencies = [
    lxml
  ];

  # Tests are not uploaded to PyPi. TODO: fetch from GitHub
  # nativeCheckInputs = [
  #   pytestCheckHook
  # ];

  pythonImportsCheck = [
    "pyfomod"
  ];

  meta = with lib; {
    description = "High-level Fomod library";
    homepage = "https://pyfomod.readthedocs.io";
    changelog = "https://github.com/GandaG/pyfomod/blob/master/CHANGELOG.md";
    license = "Apache-2.0";
    maintainers = with maintainers; [ loicreynier ];
  };
}
