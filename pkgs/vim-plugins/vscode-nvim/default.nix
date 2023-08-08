{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vscode.nvim";
  version = "2023-08-08";
  src = fetchFromGitHub {
    owner = "Mofiqul";
    repo = "vscode.nvim";
    rev = "11b212096a0b2056fc8acaf31c0d62d656b6fd2d";
    hash = "sha256-iwk1Nv+Q1Sc7Zpo3JQrN2QuHjVoTUlzM4S9OraT94P0=";
  };
  meta.homepage = "https://github.com/Mofiqul/vscode.nvim";
}
