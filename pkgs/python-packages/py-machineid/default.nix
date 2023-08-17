{ lib
, buildPythonPackage
, fetchPypi
, winregistry
}:

buildPythonPackage rec {
  pname = "py-machineid";
  version = "0.4.3";

  meta = with lib; {
    description = "Library to get the unique machine ID of any host";
    homepage = "https://github.com/keygen-sh/py-machineid";
    license = licenses.mit;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-g0s9LJSn9q7otsTK8Q6773HKK/HO+IPFN5vCIYYSStI=";
  };

  propagatedBuildInputs = [
    winregistry
  ];

  pythonImportsCheck = [ "machineid" ];
}
