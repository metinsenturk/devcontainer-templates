
# Python + uv (python-uv)

Python development environment with uv package manager (via devcontainers-extra feature).

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| projectName | Name for this project/workspace: | string | Python + uv |
| imageName | Docker image name: | string | python_playground |
| pythonVersion | Python version to install via uv: | string | 3.13 |
| bare | Use --bare mode for uv init (minimal pyproject.toml only): | boolean | true |
| useJupyter | Enable Jupyter notebooks (installs ipykernel on post-create): | boolean | true |

# Dev Container & Tooling Overview

## Project Overview & Core Features
- Devcontainer-based Python setup with `uv` managing environments and dependencies (`pyproject.toml` + `uv.lock`).
- VS Code + Pylance plus pre-installed extensions: Ruff (lint/format/imports), Mypy (types), Jupyter.
- Post-create flow: verifies tools → installs Python → initializes project (if needed) → syncs dependencies.
- Logs available at `/tmp/test-tools.log`, `/tmp/init.log`, `/tmp/jupyter-kernel.log`, and `/tmp/uv-sync.log` for debugging post-create issues.

## Devcontainer Setup
- Base: Ubuntu image (`mcr.microsoft.com/devcontainers/base:ubuntu`) with `uv` feature for fast, reproducible environments.
- Rationale: keep the container minimal; let `uv` handle Python version and dependency management.
- UV usage: `uv sync` to materialize `.venv`; `uv run ...` to execute tools/commands in the environment.
- Docker Compose orchestration with configurable image name and Python version (3.11-3.14 supported).
- Devcontainer config in `.devcontainer/devcontainer.json`:
  - Extensions: Python, Pylance, Ruff, Mypy, Jupyter
  - Post-create command: `make post-create`
  - Environment variables: `PROJECT_NAME`, `PYTHON_VERSION`, `UV_INIT_BARE`, `INSTALL_IPYKERNEL` (set from `useJupyter`)

## Makefile Commands
The template includes a `Makefile` with the following targets:

- `make post-create`: Full initialization sequence (test-tools → init → ensure-ipykernel → sync)
- `make ensure-ipykernel`: Installs `ipykernel` as a dev dependency only if missing (controlled via `INSTALL_IPYKERNEL`) → logs to `/tmp/jupyter-kernel.log`
- `make test-tools`: Verifies installed tools (uv, Python, bash, git, etc.) → logs to `/tmp/test-tools.log`
- `make init`: Installs Python via `uv python install`, creates minimal `pyproject.toml` if missing (uses `--bare` by default) → logs to `/tmp/init.log`
- `make sync`: Runs `uv sync` to install dependencies → logs to `/tmp/uv-sync.log`
- `make lint`: Runs `uv run ruff check .`
- `make format`: Runs `uv run ruff format .`
- `make type-check`: Runs `uv run mypy .`

## Python, Packages, and Jupyter
- Package installs: `uv add <package>`; dev-only tools: `uv add --dev <package>`
- Source of truth: `pyproject.toml` (managed by `uv`); `uv.lock` pins exact versions for reproducibility
- Initial project: template creates minimal `pyproject.toml` via `uv init --bare` (no boilerplate files)
- Notebooks: use VS Code's built-in Jupyter support; select `.venv/bin/python` as kernel
  - Add `ipykernel` when needed: `uv add --dev ipykernel`

## Code Quality & Tooling
- Pre-installed VS Code extensions: Python, Pylance, Ruff, Mypy, Jupyter
- Workflow: 
  - VS Code extensions provide real-time feedback in the editor
  - CLI commands via Makefile for reproducible checks: `make lint`, `make format`, `make type-check`
  - `uv run` ensures commands execute in the managed `.venv`
- Configuration: Add tool settings to `pyproject.toml` (e.g., `[tool.ruff]`, `[tool.mypy]`)

## VS Code Configuration
- `.vscode/settings.json` pre-configured with:
  - **Formatter:** Ruff with format-on-save (automatic code formatting on every save)
  - **Import organization:** Automatic import sorting on save (groups stdlib, third-party, local)
  - **Auto-fixes:** Ruff fixable issues on save (unused imports, whitespace, etc.)
  - **Interpreter:** `.venv/bin/python` (points to managed environment created by `uv sync`)
  - **Type checking:** Mypy real-time feedback via mypy-type-checker extension
  - **Tool configs:** Ruff and Mypy configured to read from `pyproject.toml` for consistency
- **Result:** Real-time code quality feedback on save; no manual `make` commands needed for formatting/fixes

## Template Options
- `projectName`: Workspace display name (default: "Python + uv")
- `imageName`: Docker image/container name (default: "python_playground")
- `pythonVersion`: Python version to install (default: "3.13"; options: 3.11-3.14)
- `bare`: Use minimal `uv init --bare` mode (default: true; creates only `pyproject.toml`)
- `useJupyter`: Enable Jupyter notebooks; installs `ipykernel` during post-create (default: true)

## File Structure
- `.devcontainer/devcontainer.json`: Container definition, extensions, environment variables, post-create command
- `.devcontainer/docker-compose.yml`: Docker Compose orchestration with configurable image name
- `.devcontainer/Dockerfile`: Minimal Ubuntu base image definition
- `.devcontainer/test_tools.sh`: Tool verification script (checks uv, Python, bash, git, etc.)
- `Makefile`: Orchestration for post-create and common development commands
- `pyproject.toml`: Created by `make init` if missing; manages project metadata, dependencies, and tool configs
- `uv.lock`: Generated by `uv sync`; resolved, pinned dependency versions for reproducibility


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/metinsenturk/devcontainer-templates/blob/main/src/python-uv/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
