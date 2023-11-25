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
  format = "pyproject";
  disabled = pythonOlder "3.7";

  meta = with lib; {
    description = "Scientific library providing a collection of spectral collocation differentiation matrices";
    homepage = "https://github.com/labrosse/dmsuite";
    changelog = "https://github.com/labrosse/dmsuite/releases/tag/v${version}";
    license = licenses.gpl2;
    maintainers = with maintainers; [ loicreynier ];
  };

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IqLsHkGNgPz2yZm0QMyMMo6Mr2RsU2DPGxYpoNwC3fs=";
  };

  nativeBuildInputs = [
    numpy
    setuptools
    setuptools-scm
    scipy
  ];

  pythonImportsCheck = [
    "dmsuite"
  ];
}
