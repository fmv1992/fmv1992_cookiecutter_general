# `fmv1992_cookiecutter_general`

A generic [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/) template with `docker` support.

## Usage

```
cookiecutter https://github.com/fmv1992/fmv1992_cookiecutter_general --no-input --checkout master
```

## Test

```
cdp fmv1992_cookiecutter_general
just test
```

Test the `justfile` itself:

```
cdp fmv1992_cookiecutter_general
just --summary \
    | sed --regexp-extended 's# #\n#g' \
    | sort \
    | parallel \
        --verbose \
        --no-run-if-empty \
        --group \
        --keep-order \
        --halt soon,fail=1 \
        --jobs 1 \
        --max-args 1 \
        -- \
        '
set -Eeuo pipefail

# Necessary since the order of entries is important.
git checkout -- cookiecutter.json || true

if just {}; then
    :
else
    echo '"'"'✘: `just` rule: `{}`.'"'"'
fi
'
```

## TODO

*   ̶A̶̶̶d̶̶̶d̶̶ ̶`̶̶̶s̶̶̶u̶̶̶d̶̶̶o̶̶̶`̶̶ ̶t̶̶̶o̶̶ ̶r̶̶̶e̶̶̶g̶̶̶u̶̶̶l̶̶̶a̶̶̶r̶̶ ̶u̶̶̶s̶̶̶e̶̶̶r̶̶̶.̶̶

*   ̶A̶̶̶d̶̶̶d̶̶ ̶`̶̶̶d̶̶̶u̶̶̶m̶̶̶b̶̶̶-̶̶̶i̶̶̶n̶̶̶i̶̶̶t̶̶̶`̶̶̶.̶̶
