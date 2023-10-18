{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vscode-nvim";
  version = "2023-10-17";
  src = fetchFromGitHub {
    owner = "Mofiqul";
    repo = "vscode.nvim";
    rev = "563e3f671543ba14f23ccb57020a428add640d02";
    hash = "sha256-rY/oE1NjqVskaeU5eaVQiy08uz3Bg/Z031wVjy3nPBI=";
  };
  meta.homepage = "https://github.com/Mofiqul/vscode.nvim";
}
