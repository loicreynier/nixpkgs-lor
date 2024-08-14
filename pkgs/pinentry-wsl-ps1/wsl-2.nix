{ pinentry-wsl-ps1, fetchpatch }:

pinentry-wsl-ps1.overrideAttrs (oldAttrs: {
  pname = oldAttrs.pname + "-wsl2";
  version = "0.2-unstable-2023-03-10";

  patches = [
    # WSL 2 systemd patch
    (fetchpatch {
      url = "https://github.com/diablodale/pinentry-wsl-ps1/pull/18.patch";
      hash = "sha256-TtUMi49Hlsl8FwZuMh71ySTudB6kNdJ4808kVfIFK4Y=";
    })
  ];

})
