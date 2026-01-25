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

# === User Setup ===
check "vscode user exists" id vscode
check "vscode sudoer" test -f /etc/sudoers.d/vscode

# Report results
reportResults
