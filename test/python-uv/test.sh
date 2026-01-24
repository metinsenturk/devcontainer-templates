#!/bin/bash
cd $(dirname "$0")
source ../test-utils/test-utils.sh

# Template specific tests
check "python version" python --version
check "pip installed" pip --version
check "git installed" git --version

# uv checks (requires uv to be installed in the container)
check "uv installed" uv --version

# Basic Python functionality
check "python basic functionality" python -c "print('Hello from Python+uv test')"

# Report result
reportResults
