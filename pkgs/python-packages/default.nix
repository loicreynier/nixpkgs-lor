{ python }:

with python;
{
  betterbib = callPackage ./betterbib { };
  dmsuite = callPackage ./dmsuite { };
  plm = callPackage ./plm { };
  py-machineid = callPackage ./py-machineid { };
  x21 = callPackage ./x21 { };
  xdg-open-wsl = callPackage ./xdg-open-wsl { };
  winregistry = callPackage ./winregistry { };
}
