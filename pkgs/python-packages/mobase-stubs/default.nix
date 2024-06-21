{ lib
, buildPythonPackage
, fetchPypi
, mypy
, pyqt5-stubs
, pythonOlder
}:

buildPythonPackage rec {
  pname = "mobase-stubs";
  version = "2.4.0";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-K3aiZOGuFsjr20qVb3bD02atlIJ68HrtuYwgPU6H4f4=";
  };

  dependencies = [
    mypy
    pyqt5-stubs
  ];

  doCheck = false;

  pythonImportsChecks = [
    "mobase-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for MO2 Python API";
    homepage = "https://github.com/ModOrganizer2/pystubs-generation";
    license = licenses.mit;
    maintainers = with maintainers; [ loicreynier ];
  };
}
