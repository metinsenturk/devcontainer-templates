#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "git installed" git --version

# uv checks (requires uv to be installed in the container)
check "uv installed" uv --version

# installed by uv tests
check "python not on path" sh -c '! command -v python'
check "python version" uv run python --version

# Basic Python functionality
check "python basic functionality" uv run python -c "print('Hello from Python+uv test')"

# Report result
reportResults
