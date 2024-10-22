"""Do nothing.

This is a hook; see:
<https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html?highlight=hook>.
"""

import sys


def main():
    print(f"Running `{__file__}`.", file=sys.stderr)


if __name__ == "__main__":
    main()
