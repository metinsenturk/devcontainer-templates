#!/bin/bash
cd $(dirname "$0")
source /utils/test-utils.sh

# === Development & Python ===
check "python installed" python --version
check "pip installed" pip --version
check "python basic functionality" python -c "print('OK')"

# === Version Control ===
check "git installed" git --version

# === Build Tools ===
check "gcc installed" gcc --version
check "g++ installed" g++ --version
check "make installed" make --version

# === Utilities ===
check "curl installed" curl --version
check "ssh installed" ssh -V
check "gpg installed" gpg --version
check "sudo installed" sudo --version

# === Shell & Text Processing ===
check "bash installed" bash --version
check "grep available" grep --version
check "sed available" sed --version
check "awk available" awk 'BEGIN { print "OK" }'
check "find available" find --version

# === Pipx Tools ===
check "virtualenv installed" virtualenv --version
check "autopep8 installed" autopep8 --version
check "black installed" black --version
check "ruff installed" ruff --version
check "flake8 installed" flake8 --version
check "mypy installed" mypy --version
check "isort installed" isort --version
check "pylint installed" pylint --version
check "pipenv installed" pipenv --version
check "poetry installed" poetry --version
check "tox installed" tox --version
check "nox installed" nox --version

# === User Setup ===
check "vscode user exists" id vscode
check "vscode sudoer" test -f /etc/sudoers.d/vscode

# Report results
reportResults
