"""Do nothing.

This is a hook; see:
<https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html?highlight=hook>.

One cannot modify/add variables with python at runtime. See
`fmv1992_cookiecutter_general:c43406f:hooks/pre_gen_project.py:23` for
details.

Useful links:

1.  <https://cookiecutter.readthedocs.io/en/2.1.1/advanced/hooks.html>.

1.  <https://cookiecutter.readthedocs.io/en/2.1.1/advanced/private_variables.html>.

1.  <https://stackoverflow.com/questions/72077557/how-to-use-dynamic-variables-in-cookiecutter-hooks>.

1.  <https://github.com/samj1912/cookiecutter-advanced-demo/blob/master/hooks/pre_gen_project.py>.

But see that with double underscores the desired effect can be achieved:
<https://cookiecutter.readthedocs.io/en/latest/advanced/private_variables.html#private-variables>:

> Cookiecutter allows the definition private variables by prepending an
> underscore to the variable name. The user will not be required to fill those
> variables in.
"""

import sys


def main():
    print(f"Running `pre_gen_project.py`.", file=sys.stderr)


if __name__ == "__main__":
    main()
