{ autoPatchelfHook
, buildPythonPackage
, fetchurl
, python
, stdenv
}:

let
  pyVerNoDot = builtins.replaceStrings [ "." ] [ "" ] python.pythonVersion;

  version = "0.4.19";

  sources = {
    "312" = {
      name = "x21-0.4.19-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/38/48/15c7457e9e070b5f54071dc7fe22a4610c62637ab875da136be1fec228d7/x21-0.4.19-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-rHyGWirrEBLYXGppZWJrCm9UXx/dVMFbTO61gaT29Do=";
    };
    "311" = {
      name = "x21-0.4.19-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/74/a4/e48981dc33a234b350aae0c99f2c8f284d4d877978cabb86d826a7f5494b/x21-0.4.19-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-h0Ff865dz76QTDxa2cBROxkxvYJuBeLx7Kx50UHW/4c=";
    };
    "310" = {
      name = "x21-0.4.19-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/7e/95/055eee7fd587dd6ed70befdb9faa3d1af7730d45c5343f393e2c1da82697/x21-0.4.19-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-kwvHzdSrZEBzd2fGhDGQjyc+raLh3/t9Kyuk0Qd4LeI=";
    };
    "39" = {
      name = "x21-0.4.19-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/d3/07/c2278e17d37f0a80bafd79d27c89a023744ae706635690563f855faff953/x21-0.4.19-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-Kh/4V56XOuAzG/nTkMibY/RLINCkE2ol9wou+7GBtq8=";
    };
  };
in
buildPythonPackage rec {
  pname = "x21";
  format = "wheel";
  inherit version;

  src = fetchurl sources."${pyVerNoDot}";

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  nativeBuildInputs = [ autoPatchelfHook ];

  pythonImportsCheck = [ "x21" ];
}
