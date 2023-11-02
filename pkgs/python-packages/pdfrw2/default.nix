{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdfrw2";
  version = "0.5.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5qnMq4Pnaaeov+Lb3fD0ndfr5SAy6SlXTwG7v6IZce0=";
  };

  # Some tests rely on Python 2 and requires the extra download of:
  # `github.com/pmaupin/static_pdfs`
  doCheck = false;

  meta = with lib; {
    description = "Pure Python library that reads and writes PDFs";
    homepage = "https://github.com/sarnold/pdfrw";
    maintainers = with maintainers; [ loicreynier ];
    license = licenses.mit;
  };
}
