## Features

- **Base Image**: `ghcr.io/metinsenturk/devcontainer-templates/simple-python`
- **Python**: Version 3.13 (configurable via `imageVariant` option) with pip
- **Shell**: [Zsh](https://www.zsh.org/) with [Starship](https://starship.rs/) prompt for enhanced terminal experience
- **User**: Non-root `vscode` user with sudoer privileges
- **Workspace**: Projects mounted to `/workspace` inside the container

## Pre-installed Development Tools

See [README.md](https://github.com/metinsenturk/devcontainer-templates/blob/main/images/simple-python/README.md) for `simple-python` image features and pre-installed tooling details.

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
