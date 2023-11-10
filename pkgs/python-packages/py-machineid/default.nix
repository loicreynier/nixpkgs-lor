{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.4.6";

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-09nNharjHS8XLyeDPl/Rff/Sz3xJGDkOwGMAcC0CzY4=";
  };

  propagatedBuildInputs = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];
}
