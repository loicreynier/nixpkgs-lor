{ stdenv
, fetchFromGitHub
, fetchpatch
, lib
, withPatches ? true
}:
stdenv.mkDerivation rec {
  pname = "goto";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "iridakos";
    repo = pname;
    rev = "b7fda54e0817b9cb47e22a78bd00b4571011cf58";
    hash = "sha256-dUxim8LLb+J9cI7HySkmC2DIWbWAKSsH/cTVXmt8zRo=";
  };

  patchFlags = [
    "-F3"
  ];

  patches = [
    ./dont-touch-db.patch
  ] ++ lib.optional withPatches [
    ./replace-mv-by-command-mv.patch
    (fetchpatch {
      name = "alias-subdir-completion";
      url = "https://github.com/iridakos/goto/commit/6ccea40a8f0b331897d71af1d88c5f458b40faa4.patch";
      sha256 = "sha256-vWjCXKEOvq0kbvN9iFiBcewbOMTCNzYKCb4Hr4mmubk=";
    })
    (fetchpatch {
      name = "sort-feature";
      url = "https://github.com/iridakos/goto/pull/67/commits/916fca0f5b5bec096dffc10ee48ca99de28043c5.patch";
      sha256 = "sha256-yIxsvOpupz1Ez6Y6X43b9LsVMHtVRiSxcclf4cMUP04=";
    })
  ];

  outputs = [ "out" ];

  dontBuild = true;

  installPhase = ''
    install -Dm644 goto.sh $out/share/${pname}/goto.sh
  '';

  meta = with lib; {
    description = "Shell utility allowing users to navigate to aliased directories";
    homepage = "https://github.com/iridakos/goto";
    changelog = "https://github.com/iridakos/goto/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = [ maintainers.loicreynier ];
  };
}
