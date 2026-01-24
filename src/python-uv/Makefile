.PHONY: post-create test-tools init sync lint format type-check

# Post-create command: run tool verification, init project, and sync dependencies
post-create: test-tools init sync

# Initialize Python environment with uv and create pyproject.toml if needed
init:
	@echo "Installing Python ${PYTHON_VERSION}..."
	@uv python install ${PYTHON_VERSION}
	@if [ ! -f pyproject.toml ]; then \
		echo "Initializing project..."; \
		if [ "${UV_INIT_BARE}" = "true" ]; then \
			uv init --bare --python ${PYTHON_VERSION}; \
		else \
			uv init --python ${PYTHON_VERSION}; \
		fi; \
	fi

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
