# Devcontainer Templates

Lightweight devcontainer templates for Python projects:

- `python`: classic pip/venv on Ubuntu base
- `python-uv`: uv-managed Python on Ubuntu base

## What's Here

- Templates live under `src/` with their `.devcontainer` configs
- Tests live under `test/` with per-template `test.sh` plus shared `test-utils`

## How to Use

### VS Code
1) Open the Command Palette → “Dev Containers: Add Dev Container Configuration Files…”.
2) Select where to add the configuration files (e.g., current workspace folder).
3) Choose a container configuration template or select “Enter custom template ID”, then paste:
	- `ghcr.io/metinsenturk/devcontainer-templates/python-uv:latest`
4) Complete the questionnaire from the template (options and defaults).
5) Optionally add more features when prompted.
6) Finish and files will appear in the current folder.

### CLI
```
devcontainer templates apply --template-id ${TEMPLATE-ID} --template-repo https://github.com/metinsenturk/devcontainer-templates
```

## Template Highlights

| Template ID | Package manager | Python install | Extras |
|-------------|-----------------|----------------|--------|
| python      | pip + venv      | System Python  | VS Code Python + Pylance extensions |
| python-uv   | uv              | `uv python install` (version option) | Makefile (`post-create`, `sync`, `lint`, `type-check`), optional Jupyter |

## Testing Locally

Open this repository in its own Dev Container, then run the smoke tests per template.

Note: The build step is required because it prepares `/tmp/${TEMPLATE-ID}` by copying the template sources, injecting the test assets into `test-project/`, installing the Dev Containers CLI, and starting the dev container. The test step then executes `test-project/test.sh` inside that running container.

```
./.github/actions/smoke-test/build.sh ${TEMPLATE-ID}
./.github/actions/smoke-test/test.sh ${TEMPLATE-ID}
```

## Publishing

Packages are published from this repo (see GitHub Packages/OCI artifacts for availability). To have templates show up in the VS Code UI, publish to GHCR and add your collection to the public index at containers.dev/templates.

## License

MIT
