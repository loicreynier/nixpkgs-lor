{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.6.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AMONhSHUKaRTm92SlnI02yihorSyYwYrNRygAjMuYz8=";
  };

  dependencies = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };
}
