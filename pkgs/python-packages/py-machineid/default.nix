{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.4.4";

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-NYKZkmhHhPoJwGGFFB8j6/i2/8KA04+uKIPfiG+qiD4=";
  };

  propagatedBuildInputs = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];
}
