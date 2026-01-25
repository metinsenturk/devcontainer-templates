# simple-python

Minimal Python development image with essential tools. **✅ Fully tested and validated.**

## Features

- Base: `python:3.13-slim-bookworm`
- Non-root user: `vscode` (UID 1000)
- Pre-installed tools: git, curl, build-essential, openssh-client
- Multi-arch: `linux/amd64`, `linux/arm64`

## OS Info

- **Distribution**: Debian GNU/Linux 12 (Bookworm)
- **Architecture**: x86_64 (amd64) / aarch64 (arm64)
- **Package Manager**: apt/apt-get

## CLI Apps Available

**Development & Version Control:**
- `python` - Python 3.13 interpreter
- `pip` - Python package manager
- `git` - version control

**Build & Compilation:**
- `gcc`, `g++`, `make` - C/C++ compiler and build tools
- `build-essential` - meta-package for compilation

**Python Development Tools (via pipx):**
- `virtualenv` - Virtual environment management
- `black` - Code formatter
- `ruff` - Fast Python linter and formatter
- `flake8` - Style guide enforcement
- `mypy` - Static type checker
- `isort` - Import statement organizer
- `pylint` - Code analyzer
- `pipenv` - Dependency management
- `poetry` - Poetry package manager
- `tox` - Testing automation
- `nox` - Flexible test automation

**Utilities:**
- `curl` - data transfer and downloads
- `ssh`, `scp`, `sftp` - SSH tools (openssh-client)
- `gpg` - encryption and signing
- `sudo` - run commands as root
- `bash`, `sh` - shells
- `grep`, `sed`, `awk`, `cut`, `sort`, `find` - text/file processing
- `cat`, `ls`, `mkdir`, `rm`, `cp`, `mv` - file operations
- `apt-get` - package manager

## Usage

Pull from GHCR:

```bash
docker pull ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest
```

Run interactively:

```bash
docker run -it --rm ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest
```

Use in a devcontainer:

```json
{
  "image": "ghcr.io/metinsenturk/devcontainer-templates/simple-python:3.13"
}
```

## Build Locally

```bash
docker build -t simple-python:test -f images/simple-python/Dockerfile images/simple-python
```

## Testing

Run included test suite (35 assertions):

```bash
docker run --rm \
  -v $(pwd)/test/images/simple-python:/tests \
  -v $(pwd)/test/test-utils:/utils \
  simple-python:test \
  bash /tests/test.sh
```

Expected output: **All 35 tests pass** ✅

Covers: Python, pip, git, gcc, g++, make, curl, ssh, gpg, sudo, bash, grep, sed, awk, find, virtualenv, autopep8, black, ruff, flake8, mypy, isort, pylint, pipenv, poetry, tox, nox, vscode user, sudoer privileges.

## Version

Current: `3.13`

## License

MIT
