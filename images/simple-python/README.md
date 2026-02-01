# 🐍 simple-python

A high-performance, development container based on `python:3.13-slim-bookworm`. It bridges the gap between a minimal runtime and a fully-loaded development environment.

## 🎯 Project Goals

The goal of this image is to provide a "Goldilocks" environment for Python development:

* **Small & Lean**: I like being minimalistic. Built on a `slim` base, this image maintains a minimal footprint by including only a hand-picked selection of essential tools, ensuring the environment remains lightweight, fast, and focused.
* **Capable**: Includes `build-essential` and core headers so that common Python libraries (even those requiring C extensions) install and run without friction.
* **Evolving**: This is a personal sandbox. It changes as my project needs change, making it ideal for rapid development across various personal projects.

> [!IMPORTANT]
> **Note on Stability:** Because this image is tuned for active development and my personal workflow, it may change frequently. It is recommended for **development use only**, not for mission-critical production environments.

---

Why to use this image instead of [Microsoft Python Development Container Image](https://hub.docker.com/r/microsoft/devcontainers-python)? No reason, you can use it. I am just experiencing here with my own image.

---

## 🚀 Quick Start

### Use in VS Code

Add this to your `.devcontainer/devcontainer.json`:

```json
{
  "image": "ghcr.io/metinsenturk/devcontainer-templates/simple-python:3.13"
}

```

### Pull and Run

```bash
docker pull ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest
docker run -it --rm ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest

```

---

## 🛠️ Image Specifications

* **Base Image:** `python:3.13-slim-bookworm`
* **Default Shell**: [Zsh](https://www.zsh.org/) with [Starship](https://starship.rs/) prompt customization.
* **User Context:** Non-root `vscode` user (UID 1000) with `sudo` privileges.
* **Architectures:** Multi-arch support for `amd64` and `arm64`.
* **Core Tools:** `git`, `curl`, `build-essential` (gcc, g++, make), `openssh-client`, and `gpg`.

---

## 🐍 Python Toolkit (via pipx)

The following tools are pre-installed in isolated environments for maximum stability:

| Category | Tools |
| --- | --- |
| **Linting & Formatting** | [Ruff](https://github.com/astral-sh/ruff), [Black](https://github.com/psf/black), [Mypy](https://github.com/python/mypy), [Flake8](https://github.com/PyCQA/flake8), [Isort](https://github.com/PyCQA/isort), [Pylint](https://github.com/pylint-dev/pylint), [autopep8](https://github.com/hhatto/autopep8) |
| **Project Management** | [uv](https://github.com/astral-sh/uv), [Poetry](https://github.com/python-poetry/poetry), [Pipenv](https://github.com/pypa/pipenv), [virtualenv](https://github.com/pypa/virtualenv) |
| **Testing & Automation** | [Tox](https://github.com/tox-dev/tox), [Nox](https://github.com/wntrblm/nox) |

---

## 🧪 Validation & Testing

This image is [tested and validated](../../test/images/simple-python/test.sh). Test script verifies Python environment, compiler toolchains, SSH/GPG utilities, all `pipx` tools, and `sudo` permissions.

To run the tests locally:

```bash
# 1. Build the image
docker build -t simple-python:test -f images/simple-python/Dockerfile images/simple-python

# 2. Execute the test suite
docker run --rm \
  -v $(pwd)/test/images/simple-python:/tests \
  -v $(pwd)/test/test-utils:/utils \
  simple-python:test \
  bash /tests/test.sh

```

## 📄 License

Licensed under the **MIT License**.
