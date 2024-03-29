# Make README
make-readme:
    python3 ./docs/make_readme.py

# Update and rebuild all packages (for testing)
update: update-inputs rebuild-all

# Update flake's inputs
update-inputs:
    nix flake update

# Build all packages
build-all:
    nix flake show --json \
        | jq '.packages."x86_64-linux"|keys[]' \
        | xargs -I {} nix build .#{}

# Rebuild all packages
rebuild-all:
    nix flake show --json \
        | jq '.packages."x86_64-linux"|keys[]' \
        | xargs -I {} nix build --rebuild .#{}
