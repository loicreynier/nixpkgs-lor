# Make README
make-readme:
    python3 ./docs/make_readme.py

# Build all packages
build-all:
    nix flake show --json | jq  '.packages."x86_64-linux"|keys[]'| xargs -I {} nix build .#{}
