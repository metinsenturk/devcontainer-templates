## Features

- **Base Image**: Built from `mcr.microsoft.com/devcontainers/base:ubuntu` via Docker Compose
- **Python**: Installed via [uv](https://github.com/astral-sh/uv) (version configurable: 3.11-3.14)
- **Package Management**: uv for fast, reproducible dependency management
- **Shell**: Bash (default Ubuntu base)
- **User**: Non-root `vscode` user
- **Workspace**: Projects mounted to `/workspace` inside the container

## Pre-installed Tools

- **Version Control**: Git
- **Utilities**: curl, wget, build-essential, openssh-client, gnupg, zip/unzip
- **Package Manager**: uv (Python package installer and resolver)
- **Optional**: ipykernel (when Jupyter is enabled via template option)

## VS Code Extensions

This template comes with the following VS Code extensions pre-configured:
- **ms-python.python** - Python language support
- **ms-python.vscode-pylance** - Fast language server
- **charliermarsh.ruff** - Linting, formatting, and import organization
- **ms-python.mypy-type-checker** - Type checking
- **ms-toolsai.jupyter** - Jupyter notebook support

## Makefile Commands

The template includes a `Makefile` for common tasks:

- **`make post-create`** - Full initialization (test-tools → init → ensure-ipykernel → sync)
- **`make init`** - Install Python via uv, create `pyproject.toml` if missing
- **`make sync`** - Sync dependencies with `uv sync`
- **`make lint`** - Run ruff linter
- **`make format`** - Run ruff formatter
- **`make type-check`** - Run mypy type checker
- **`make test-tools`** - Verify installed tools
- **`make gitignore`** - Download Python .gitignore from GitHub

## Template Options

- **projectName** - Project display name (default: "Python + uv")
- **imageName** - Docker image name (default: "python_playground")
- **pythonVersion** - Python version (3.11, 3.12, 3.13, 3.14; default: "3.13")
- **bare** - Use minimal `uv init --bare` mode (default: true)
- **useJupyter** - Enable Jupyter notebooks with ipykernel (default: true)

## Workspace Configuration

- **Workspace Folder**: `/workspace` (inside container)
- **Mount Type**: Bind mount (your local project folder synced in real-time)
- **Working Directory**: Automatically set to `/workspace`
- **Dependencies**: Managed via `pyproject.toml` and `uv.lock`

## VS Code Settings

Pre-configured in `.vscode/settings.json`:
- **Formatter**: Ruff with format-on-save enabled
- **Import organization**: Automatic sorting on save
- **Auto-fixes**: Ruff fixable issues on save
- **Interpreter**: `.venv/bin/python` (created by uv sync)
- **Type checking**: Real-time feedback via mypy extension

## Development Workflow

1. **Dependencies**: Add packages with `uv add <package>` or `uv add --dev <package>`
2. **Sync**: Run `make sync` or `uv sync` to install dependencies
3. **Quality checks**: Use `make lint`, `make format`, `make type-check`
4. **Notebooks**: Use VS Code Jupyter support; select `.venv/bin/python` as kernel
5. **Configuration**: Add tool settings to `pyproject.toml` (e.g., `[tool.ruff]`, `[tool.mypy]`)

## Logs

Post-create and command logs are saved to `/tmp/` for debugging:
- `/tmp/test-tools.log` - Tool verification
- `/tmp/init.log` - Python installation and project initialization
- `/tmp/jupyter-kernel.log` - ipykernel installation
- `/tmp/uv-sync.log` - Dependency sync
- `/tmp/gitignore.log` - .gitignore download
