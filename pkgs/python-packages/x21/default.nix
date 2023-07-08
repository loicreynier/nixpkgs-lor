{ autoPatchelfHook
, buildPythonPackage
, fetchurl
, python
, stdenv
}:

let
  pyVerNoDot = builtins.replaceStrings [ "." ] [ "" ] python.pythonVersion;

  version = "0.4.10";

  sources = {
    "311" = {
      name = "x21-0.4.10-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/a3/6a/5be6e22c89857d2671b52585afc1e4e6db03a1d90fe4c48a3426a0012753/x21-0.4.10-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-8wmEoQiyBnqgP1KHOuuYpPe49C03reuqsyRSa8hLkGY=";
    };
    "310" = {
      name = "x21-0.4.10-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/70/57/a5c48395c7c107a7d6717e4d81e2645384d24710935e85520452c2950bf6/x21-0.4.10-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-o8w9jwQKZ0wxfZ8GoDxz0Bp2BptpbGFLkzmgYESo7/o=";
    };
    "39" = {
      name = "x21-0.4.10-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      url = "https://files.pythonhosted.org/packages/59/d0/0e37b135fe42c7e6738b694325dea847baf3fa19eead31f48476803ce186/x21-0.4.10-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-XbjEtvbY6y6JGIZk4pWO69YQV6Ziyxv6yKaBAfy1bZ0=";
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
