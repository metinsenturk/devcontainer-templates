#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "python version" python --version
check "pip installed" pip --version
check "python3 available" python3 --version
check "git installed" git --version

# Test Python functionality
check "python basic functionality" python -c "print('Hello from Python test')"
check "pip install works" pip install --quiet requests
check "installed package works" python -c "import requests; print('requests imported successfully')"

# Test if sample files are present (if they exist)
# if [ -f "/workspaces/*/main.py" ]; then
#     check "sample main.py exists" ls /workspaces/*/main.py
# fi

# if [ -f "/workspaces/*/requirements.txt" ]; then
#     check "requirements.txt exists" ls /workspaces/*/requirements.txt
# fi

# Report result
reportResults
