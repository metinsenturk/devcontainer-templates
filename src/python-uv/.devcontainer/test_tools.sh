#!/bin/bash

echo "=== Testing Installed Tools ==="
echo
echo "Documentation: Tools included in python_playground2 devcontainer"
echo "================================================================"
echo
echo "Core Tools (from Ubuntu base + uv feature):"
echo "  - uv: Python package manager"
echo "  - bash: Shell"
echo "  - git: Version control"
echo "  - curl: Data transfer/downloads"
echo "  - wget: Downloads"
echo "  - build-essential: C/C++ compiler, make, build tools"
echo "  - apt: Package manager"
echo "  - openssh-client: SSH tools"
echo "  - gnupg: Encryption/signing"
echo "  - zip/unzip: Archive tools"
echo "  - Standard utilities: grep, sed, awk, cut, sort, find, etc."
echo
echo "Note: Python is NOT pre-installed. Use 'uv python install' to add it."
echo
echo "=== Running Tool Tests ==="
echo

report_tool() {
	local name="$1"; shift
	local cmd="$*"
	if command -v "$name" >/dev/null 2>&1; then
		if [ -n "$cmd" ]; then
			local v
			v=$($cmd 2>/dev/null | head -1)
			echo "✅ ${name}: ${v}"
		else
			echo "✅ ${name}: available"
		fi
	else
		echo "❌ ${name}: not found"
	fi
}

report_tool uv "uv --version"
report_tool python "python --version"
report_tool bash "bash --version"
report_tool zsh "zsh --version"
report_tool git "git --version"
report_tool zip "zip --version"
report_tool unzip "unzip -v"
report_tool grep "grep --version"
report_tool sed "sed --version"
report_tool awk "awk --version"
report_tool find "find --version"
report_tool cut "cut --version"
report_tool sort "sort --version"
report_tool cat
report_tool ls
report_tool mkdir
report_tool rm
echo

echo "=== Test Complete ==="

# Final summary
APP_NAME=${APP_NAME:-workspace}
APP_VERSION=${APP_VERSION:-0.1.0}
echo "✅ ${APP_NAME} - ${APP_VERSION}"
