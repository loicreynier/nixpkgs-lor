{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, pythonOlder
  # , pytestCheckHook
, lxml
, tree
}:

buildPythonPackage rec {
  pname = "pyfomod";
  version = "1.2.1";
  format = "pyproject";
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

  preBuild = ''
    ${tree}/bin/tree
  '';

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    lxml
  ];

  # Tests are not uploaded to PyPi
  # nativeCheckInputs = [
  #   pytestCheckHook
  # ];

  pythonImportsCheck = [
    "pyfomod"
  ];

  meta = with lib; {
    description = "High-level Fomod library.";
    homepage = "https://pyfomod.readthedocs.io";
    changelog = "https://github.com/GandaG/pyfomod/blob/master/CHANGELOG.md";
    license = "Apache-2.0";
    maintainers = with maintainers; [ loicreynier ];
  };
}
