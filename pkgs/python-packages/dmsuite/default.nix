{ lib
, buildPythonPackage
, fetchPypi
, numpy
, pythonOlder
, setuptools
, setuptools-scm
, scipy
}:

buildPythonPackage rec {
  pname = "dmsuite";
  version = "0.3.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IqLsHkGNgPz2yZm0QMyMMo6Mr2RsU2DPGxYpoNwC3fs=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  nativeBuildInputs = [
    numpy
    scipy
  ];

  pythonImportsCheck = [
    "dmsuite"
  ];

  meta = with lib; {
    description = "Scientific library providing a collection of spectral collocation differentiation matrices";
    homepage = "https://github.com/labrosse/dmsuite";
    changelog = "https://github.com/labrosse/dmsuite/releases/tag/v${version}";
    license = licenses.gpl2;
    maintainers = with maintainers; [ loicreynier ];
  };
}
