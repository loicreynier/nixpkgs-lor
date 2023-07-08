{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vscode.nvim";
  version = "2023-06-30";
  src = fetchFromGitHub {
    owner = "Mofiqul";
    repo = "vscode.nvim";
    rev = "05973862f95f85dd0564338a03baf61b56e1823f";
    hash = "sha256-iY3S3NnFH80sMLXgPKNG895kcWpl/IjqHtFNOFNTMKg=";
  };
  meta.homepage = "https://github.com/Mofiqul/vscode.nvim";
}
