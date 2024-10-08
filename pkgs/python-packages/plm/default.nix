{
  lib,
  buildPythonPackage,
  fetchPypi,
  cryptography,
  ntplib,
  platformdirs,
  py-machineid,
  pynacl,
  requests,
  requests-cache,
  rich-argparse,
  tomli,
  tomli-w,
  x21,
}:

buildPythonPackage rec {
  pname = "plm";
  version = "0.2.11";
  format = "wheel";

  src = fetchPypi {
    inherit version format;
    pname = "python_license_manager";
    python = "py3";
    dist = "py3";
    hash = "sha256-uTNKFB6jYCvDp8Th7KSst+2ISl3KYzPeJy2PPItW5eo=";
  };

  dependencies = [
    cryptography
    ntplib
    platformdirs
    py-machineid
    pynacl
    requests
    requests-cache
    (rich-argparse.overridePythonAttrs (_: {
      doCheck = false;
    }))
    tomli
    tomli-w
    x21
  ];

  pythonImportsCheck = [ "plm" ];

  meta = {
    description = "Command-line tool and library that managers your Python software licenses";
    homepage = "https://github.com/pysos/plm";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ loicreynier ];
  };
}
