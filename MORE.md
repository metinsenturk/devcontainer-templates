## More

## What's Here

- **Templates** live under `src/` with their `.devcontainer` configs
- **Tests** live under `test/` with per-template `test.sh` plus shared `test-utils`
- **Custom Images** live under `images/` and are auto-built/published to GHCR ([see images/IMAGES.md](images/IMAGES.md))

## How to Use Templates

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
devcontainer templates apply --TEMPLATE_ID ${TEMPLATE_ID} --template-repo https://github.com/metinsenturk/devcontainer-templates
```

## Testing Locally

Open this repository in its own Dev Container, then run the smoke tests per template.

Note: The build step is required because it prepares `/tmp/${TEMPLATE_ID}` by copying the template sources, injecting the test assets into `test-project/`, installing the Dev Containers CLI, and starting the dev container. The test step then executes `test-project/test.sh` inside that running container.

```
# example id to run the test
TEMPLATE_ID="python-uv"

# run the build & testing
./.github/actions/smoke-test/build.sh ${TEMPLATE_ID}
./.github/actions/smoke-test/test.sh ${TEMPLATE_ID}
```