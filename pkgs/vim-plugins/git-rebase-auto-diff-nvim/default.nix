{ fetchFromGitHub, vimUtils }:
vimUtils.buildVimPlugin {
  pname = "git-rebase-auto-diff.nvim";
  version = "0-unstable-2023-05-24";
  src = fetchFromGitHub {
    owner = "yutkat";
    repo = "git-rebase-auto-diff.nvim";
    rev = "ad95f18cb85c24ddc0b48bf190bc313dfc58e2d6";
    hash = "sha256-5g9VTpG1s9+/lojvRPRknLCzx2EguWUDl3u9unWxo6w=";
  };
  meta.homepage = "https://github.com/yutkat/git-rebase-auto-diff.nvim";
}
