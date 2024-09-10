{
  lib,
  buildPythonPackage,
  fetchPypi,
  bibtexparser,
  platformdirs,
  plm,
  pybtex,
  pylatexenc,
  requests-cache,
  rich,
  tomli,
  unidecode,
  x21,
}:

buildPythonPackage rec {
  pname = "betterbib";
  version = "7.1.17";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    dist = "py3";
    hash = "sha256-ibp9l9nyzmyJ7J8x0y6H4mI0+IIYeG0Vv657AGJtMTE=";
  };

  dependencies = [
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

  meta = {
    description = "Tool to update BibTeX files with info from online resources";
    homepage = "https://github.com/texworld/betterbib";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ loicreynier ];
    platforms = lib.platforms.unix;
  };
}
