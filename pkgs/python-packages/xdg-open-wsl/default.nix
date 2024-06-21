{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, pythonOlder
, poetry-core
, click
}:

buildPythonPackage rec {
  pname = "xdg-open-wsl";
  version = "2022-04-16";
  pyproject = true;
  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "cpbotha";
    repo = pname;
    rev = "7d40d572d0274db4b668b5d42797ebd3d8e16885";
    hash = "sha256-Etfrp0KWieK933fZP8KDUClnLUyiMxl2G58KpN18DPk=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    click
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace \
        'build-backend = "poetry.masonry.api"' \
        'build-backend = "poetry.core.masonry.api"' \
      --replace \
        'requires = ["poetry>=0.12"]' \
        'requires = ["poetry-core>=1.0.0"]' \
      --replace \
        'click = "^7.1.1"' \
        'click = ">=7.1.1"'
  '';

  pythonImportsCheck = [
    "xdg_open_wsl"
  ];

  meta = with lib; {
    description = "xdg-open replacement for WSL that opens files and links using Windows apps";
    homepage = "https://github.com/cpbotha/xdg-open-wsl";
    license = licenses.bsd3;
    maintainers = with maintainers; [ loicreynier ];
  };
}
