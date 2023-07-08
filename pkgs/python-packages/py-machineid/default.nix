{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.3.0";

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-inllqAZ7lelZh1DZp1uQqc7s42xSJW+x5BGOL8mIBxY=";
  };

  propagatedBuildInputs = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];
}
