.PHONY: post-create test-tools sync lint format type-check

# Post-create command: run tool verification and dependency sync
post-create: test-tools sync

# Verify installed tools
test-tools:
	@echo "Running tool verification..."
	@bash .devcontainer/test_tools.sh > /tmp/test-tools.log 2>&1
	@echo "✓ Tool verification complete (log: /tmp/test-tools.log)"

# Sync dependencies with uv
sync:
	@echo "Syncing dependencies..."
	@uv sync > /tmp/uv-sync.log 2>&1
	@echo "✓ Dependency sync complete (log: /tmp/uv-sync.log)"

# Run ruff linter
lint:
	@uv run ruff check .

# Run ruff formatter
format:
	@uv run ruff format .

# Run mypy type checker
type-check:
	@uv run mypy .
