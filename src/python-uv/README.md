\n# Python + uv (python-uv)

Python development environment with uv package manager (via devcontainers-extra feature).

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| projectName | Name for this project/workspace: | string | Python + uv |
| imageName | Docker image name: | string | python_playground |
| pythonVersion | Python version to install via uv: | string | 3.13 |
| bare | Use --bare mode for uv init (minimal pyproject.toml only): | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/metinsenturk/devcontainer-templates/blob/main/src/python-uv/devcontainer-template.json).  Add additional notes to a `NOTES.md`._

## Requirements

This template includes a `Makefile` in the workspace root with a `post-create` target. The `postCreateCommand` will execute `make post-create` when the container is created. Logs are written to `/tmp/test-tools.log` and `/tmp/uv-sync.log` inside the container.


