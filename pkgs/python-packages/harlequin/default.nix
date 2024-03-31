{ lib
, buildPythonApplication
, fetchPypi
, pythonOlder
, poetry-core
, textual
, textual-dev
}: buildPythonApplication rec {
  pname = "harlequin";
  version = "1.16.2";
  format = "pyproject";

  disabled = pythonOlder "3.9";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Fvg0WNL59Bw/43Nv0lJb/M1BuRaX4C87wG669kPdoDQ=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    textual
    textual-dev
  ];

  meta = with lib; {
    licences = licenses.mit;
  };
}
