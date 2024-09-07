{ python }:
with python; {
  betterbib = callPackage ./betterbib { };
  dmsuite = callPackage ./dmsuite { };
  mktestdocs = callPackage ./mktestdocs { };
  mobase-stubs = callPackage ./mobase-stubs { };
  plm = callPackage ./plm { };
  pyfomod = callPackage ./pyfomod { };
  x21 = callPackage ./x21 { };
  xdg-open-wsl = callPackage ./xdg-open-wsl { };
  winregistry = callPackage ./winregistry { };
}
