"""Do nothing.

This is a hook; see:
<https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html?highlight=hook>.
"""

import sys


def main():
    print(f"Running `post_gen_project.py`.", file=sys.stderr)


if __name__ == "__main__":
    main()
