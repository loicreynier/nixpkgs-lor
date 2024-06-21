{ autoPatchelfHook
, buildPythonPackage
, fetchurl
, python
, stdenv
}:

let
  pyVerNoDot = builtins.replaceStrings [ "." ] [ "" ] python.pythonVersion;

  version = "0.5.1";

  sources = {
    "312" = {
      name = "x21-0.5.1-cp312-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/00/43/e1b2d42003ea86e1d49b6e504ac48f4c3deb8ebe3d5cf3c7b7124d5630ae/x21-0.5.1-cp312-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      hash = "sha256-FEenoEPmqyEY8Ts6sAAECeBwrTL4rYsZLnxOAOaTyHo=";
    };
    "311" = {
      name = "x21-0.5.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/fd/f2/fd1155b62e10b0b69308d03536c02f44f10913b60f6622997177224146c4/x21-0.5.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      hash = "sha256-bexiCsqM4mrTHH1TEXcAIS4f41qGzGWA7oz4j/Vf+Js=";
    };
    "310" = {
      name = "x21-0.5.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/ce/9b/cd11fe2e0f30d1c3e58f99e64c2bb76f1eb7bfc9aa8edacdb0c1cd098580/x21-0.5.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      hash = "sha256-1IcnMUoq+7i2N1RYIDRwrKQ8sqEbiP3TbNyKXHfAT1o=";
    };
    "39" = {
      name = "x21-0.5.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/74/9e/83e1703401014dd0e4146d63560c2c4c8ea5d98c722f2915c50752d1ed3f/x21-0.5.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      hash = "sha256-1vYGbBJ2ZkD7f7jVsWqapL9zsAdJYxTCPGJLkVay9+A=";
    };
  };
in
buildPythonPackage {
  pname = "x21";
  format = "wheel";
  inherit version;

  src = fetchurl sources."${pyVerNoDot}";

  build-system = [
    stdenv.cc.cc.lib
    autoPatchelfHook
  ];

  pythonImportsCheck = [ "x21" ];
}
