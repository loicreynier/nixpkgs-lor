{ python }:

with python; {
  pdfrw2 = callPackage ./pdfrw2 { };
  py-machineid = callPackage ./py-machineid { };
}
