#!/usr/bin/env python3

"""Script to generate the `README.md`"""

__author__ = ["Loïc Reynier <loic+dev@loicreynier.fr>"]
__version__ = "0.1.1"
__changelog__ = {
    "0.1.1": "Raise error if description ends with a period",
    "0.1.2": "Update empty description exception catching",
}

import json
import os
import subprocess
import sys

import jinja2

SYSTEM = "x86_64-linux"
README = "../README.md"
TEMPLATE = "template.md"


def flake_packages() -> dict:
    """Dictionary of packages provided by the Flake."""
    cmd = ["nix", "flake", "show", "--json"]
    process = subprocess.run(cmd, capture_output=True, check=True)
    info = json.loads(process.stdout)
    return info["packages"][SYSTEM]


def package_list(packages: dict) -> str:
    """Formatted list of `packages`."""
    list_ = []
    # Generate list
    for _, info in packages.items():
        name = info["name"]
        try:
            desc = info["description"].replace("\n", " ").strip()
            if desc[-1] == ".":
                raise ValueError(
                    f"{name}: Package description should not end with a period."
                )
            list_.append(f"`{name}`: {desc}")
        # desc[-1] -> IndexError if empty, old Nix -> no desc key
        except (
            KeyError,
            IndexError,
        ):
            list_.append(f"`{name}`")
    # Sort, add list indents and convert to string
    return "\n".join([f"- {s}" for s in sorted(list_)])


def make_readme() -> None:
    """Make `README.md` from `template.md`."""
    with open(README, "w", encoding="utf-8") as readme_file:
        readme_file.write(
            jinja2.Environment(
                loader=jinja2.FileSystemLoader(searchpath="./"),
                keep_trailing_newline=True,
            )
            .get_template(TEMPLATE)
            .render(package_list=package_list(flake_packages()))
        )


if __name__ == "__main__":
    os.chdir(sys.path[0])
    # print(os.path.basename(__file__) + ": running in " + os.getcwd())
    make_readme()
