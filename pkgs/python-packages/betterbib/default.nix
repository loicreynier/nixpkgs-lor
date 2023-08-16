{ lib
, buildPythonPackage
, fetchPypi
, platformdirs
, plm
, pybtex
, pylatexenc
, requests-cache
, rich
, tomli
, unidecode
, x21
}:

buildPythonPackage rec {
  pname = "betterbib";
  version = "5.0.11";
  format = "wheel";

  meta = with lib; {
    description = "Tool to update BibTeX files with info from online resources.";
    homepage = "https://github.com/texworld/betterbib";
    license = licenses.unfree;
    maintainers = with maintainers; [ loicreynier ];
    platforms = platforms.unix;
  };

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    dist = "py3";
    sha256 = "sha256-3Tr0D2RWGI5mis9qJY4Gl1scvfwtW1my2daGprFfaDU=";
  };

  propagatedBuildInputs = [
    platformdirs
    requests-cache
    plm
    pybtex
    pylatexenc
    rich
    tomli
    unidecode
    x21
  ];

  # No import check since it requires a license
  # pythonImportsCheck = [ "betterbib" ];
}
