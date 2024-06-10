{ lib
, buildPythonPackage
, fetchPypi
, bibtexparser
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
  version = "7.1.11";
  format = "wheel";

  meta = with lib; {
    description = "Tool to update BibTeX files with info from online resources";
    homepage = "https://github.com/texworld/betterbib";
    license = licenses.unfree;
    maintainers = with maintainers; [ loicreynier ];
    platforms = platforms.unix;
  };

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    dist = "py3";
    hash = "sha256-YwqTxmazNeZ16EiXMyYmA5MVSxFRSmqvweQY4BD234I=";
  };

  propagatedBuildInputs = [
    bibtexparser
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
