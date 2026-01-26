
# Python (python)

A Python development environment powered by the simple-python custom image.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Python version: | string | latest |

# Python Template - Detailed Information

## Features

- **Base Image**: `ghcr.io/metinsenturk/devcontainer-templates/simple-python`
- **Python**: Version 3.13 (configurable via `imageVariant` option) with pip
- **Shell**: Zsh with [Starship](https://starship.rs/) prompt for enhanced terminal experience
- **Package Management**: pip, venv, [pipx](https://github.com/pypa/pipx)
- **User**: Non-root `vscode` user with sudoer privileges
- **Workspace**: Projects mounted to `/workspace` inside the container

## Pre-installed Development Tools

- **Version Control**: Git, SSH, GPG
- **Build Tools**: gcc, g++, make, build-essential
- **Code Quality & Formatting**:
  - [autopep8](https://github.com/hhatto/autopep8) - PEP 8 formatter
  - [black](https://github.com/psf/black) - Code formatter
  - [ruff](https://github.com/astral-sh/ruff) - Linter & formatter
  - [flake8](https://github.com/PyCQA/flake8) - Style guide enforcement
  - [mypy](https://github.com/python/mypy) - Static type checker
  - [isort](https://github.com/PyCQA/isort) - Import sorter
  - [pylint](https://github.com/pylint-dev/pylint) - Code analyzer
- **Project Management**:
  - [pipenv](https://github.com/pypa/pipenv) - Dependency manager
  - [poetry](https://github.com/python-poetry/poetry) - Dependency & packaging
  - [virtualenv](https://github.com/pypa/virtualenv) - Virtual environments
- **Testing & Task Running**:
  - [tox](https://github.com/tox-dev/tox) - Test automation
  - [nox](https://github.com/wntrblm/nox) - Task runner

## VS Code Extensions

This template comes with the following VS Code extensions pre-configured:
- **ms-python.python** - Python language support
- **ms-python.isort** - Import sorting
- **ms-python.autopep8** - Code formatting
- **ms-python.mypy-type-checker** - Type checking

## Workspace Configuration

- **Workspace Folder**: `/workspace` (inside container)
- **Mount Type**: Bind mount (your local project folder synced in real-time)
- **Working Directory**: Automatically set to `/workspace`


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/metinsenturk/devcontainer-templates/blob/main/src/python/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
