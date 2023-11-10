{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.4.5";

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qF/Pea/+d+3kI6RTe9N+Ox20hefJPH+albZwATZhwC8=";
  };

  propagatedBuildInputs = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];
}
