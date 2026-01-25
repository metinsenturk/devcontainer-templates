# Custom Container Images

This directory contains custom container images that can be used independently or referenced by devcontainer templates in this repository.

## System Overview

Images are automatically built and published to GitHub Container Registry (GHCR) when changes are detected in the `images/` directory. Each image is:

- **Multi-arch**: Built for `linux/amd64` and `linux/arm64`
- **Attested**: Includes provenance and SBOM
- **Scanned**: Trivy security scan on every build
- **Versioned**: Tagged with semantic versions and `latest`

## Creating a New Image

### 1. Create Image Directory

Create a new folder under `images/` with your image name (lowercase, hyphenated):

```bash
mkdir -p images/my-image
```

### 2. Add Required Files

Each image directory must contain:

- **`Dockerfile`**: The image definition
- **`.dockerignore`**: Files to exclude from build context
- **`README.md`**: Usage documentation

**Dockerfile template:**

```dockerfile
FROM <base-image>

# OCI labels (required)
LABEL org.opencontainers.image.title="my-image"
LABEL org.opencontainers.image.description="Brief description"
LABEL org.opencontainers.image.version="1.0.0"  # or use meaningful tag like "3.13" for Python version
LABEL org.opencontainers.image.source="https://github.com/metinsenturk/devcontainer-templates"
LABEL org.opencontainers.image.licenses="MIT"

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        package1 \
        package2 \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user (recommended)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER $USERNAME
WORKDIR /workspace

CMD ["/bin/bash"]
```

**`.dockerignore` template** (copy from `images/simple-python/.dockerignore`)

**`README.md` template:**

```markdown
# my-image

Brief description of what this image provides.

## Features

- Base: `<base-image>`
- Non-root user: `vscode`
- Pre-installed: tool1, tool2, tool3

## Usage

\`\`\`bash
docker pull ghcr.io/metinsenturk/devcontainer-templates/my-image:latest
\`\`\`

## Version

Current: `1.0.0` (or use a tag that describes your image, e.g., Python version `3.13`)
```

### 3. Register in CI Workflow

Edit `.github/workflows/images.yml` and add your image to the `detect-changes` job filters:

```yaml
detect-changes:
  # ...
  steps:
    # ...
    - uses: dorny/paths-filter@v3
      id: filter
      with:
        filters: |
          simple-python:
            - 'images/simple-python/**'
          my-image:  # Add this
            - 'images/my-image/**'
```

### 4. Create Tests for Your Image (Optional but Recommended)

Tests ensure your image contains all expected tools and functionality. Place tests in `test/images/my-image/test.sh`:

```bash
#!/bin/bash
cd $(dirname "$0")
source /utils/test-utils.sh

# Test each tool/feature
check "python installed" python --version
check "git installed" git --version
check "basic functionality" python -c "print('OK')"

# Report results
reportResults
```

**Important:** Test scripts must use `source /utils/test-utils.sh` (absolute path) since CI mounts test utilities to `/utils` in the container.

The test script uses shared utilities from `test/test-utils/test-utils.sh` with:
- `check "description" command` - runs command and reports pass/fail
- `reportResults` - summarizes test results and exits with appropriate code

**Test execution:**
- Automatically runs after image build in CI
- Fails the workflow if any test fails
- Can be run locally:
  ```bash
  docker run --rm \
    -v $(pwd)/test/images/my-image:/tests \
    -v $(pwd)/test/test-utils:/utils \
    my-image:test \
    bash /tests/test.sh
  ```

### 5. Commit and Push

```bash
git add images/my-image
git commit -m "feat: add my-image container image"
git push
```

The CI workflow will:
1. Detect changes in `images/my-image/`
2. Build for `linux/amd64` and `linux/arm64`
3. Run tests from `test/images/my-image/test.sh` (if present)
4. Run security scan with Trivy
5. Generate provenance and SBOM
6. Push to `ghcr.io/metinsenturk/devcontainer-templates/my-image:latest`

## Versioning

Images follow **semantic versioning**:

- **Major** (1.x.x): Breaking changes
- **Minor** (x.1.x): New features, backward-compatible
- **Patch** (x.x.1): Bug fixes

Update the version in:
1. `Dockerfile` → `org.opencontainers.image.version` label
2. `README.md` → Version section

The CI generates tags automatically:
- `latest` (main branch only)
- `1.0.0` (specific version, or your chosen version tag like `3.13`)
- `1.0` (minor version, or applicable major.minor if using semantic versioning)
- `1` (major version, or major only if using semantic versioning)
- `main-<sha>` (branch + commit)

## Local Testing

Build locally before pushing:

```bash
# Single-arch (fast)
docker build -t my-image:test -f images/my-image/Dockerfile images/my-image

# Multi-arch (requires buildx)
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t my-image:test \
  -f images/my-image/Dockerfile images/my-image
```

Run and test:

```bash
docker run -it --rm my-image:test
```

Scan for vulnerabilities:

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  aquasec/trivy:latest image my-image:test
```

## Using Images in Devcontainer Templates

Reference your published image in `src/<template>/.devcontainer/devcontainer.json`:

```json
{
  "image": "ghcr.io/metinsenturk/devcontainer-templates/my-image:latest"
}  # or pin to specific version, e.g., my-image:1.0.0 or my-image:3.13
```

Or use `latest` for auto-updates (less reproducible):

```json
{
  "image": "ghcr.io/metinsenturk/devcontainer-templates/my-image:latest"
}
```

## Best Practices

1. **Pin base images by digest** for reproducibility:
   ```dockerfile
   FROM python:3.13-slim-bookworm@sha256:abc123...
   ```

2. **Minimize layers**: Combine RUN commands with `&&`

3. **Clean up**: Remove package lists after `apt-get install`:
   ```dockerfile
   RUN apt-get update && apt-get install -y ... && rm -rf /var/lib/apt/lists/*
   ```

4. **Use non-root user** when possible for security

5. **Keep context small**: Aggressive `.dockerignore` to speed up builds

6. **Document everything**: Clear README with usage examples

7. **Test multi-arch**: Verify both amd64 and arm64 work

8. **Security scan**: Check Trivy results in GitHub Security tab

## Available Images

| Image | Description | Status | GHCR URL |
|-------|-------------|--------|----------|
| simple-python | Minimal Python with essential tools | ✅ Tested (23/23 checks) | `ghcr.io/metinsenturk/devcontainer-templates/simple-python` |

## Troubleshooting

**Build fails with "no space left on device"**
- Clean up Docker: `docker system prune -a --volumes`

**Multi-arch build hangs**
- Check QEMU is installed: `docker run --rm --privileged multiarch/qemu-user-static --reset -p yes`

**Image not visible after push**
- Check package visibility: GitHub → Packages → Select image → Settings → Change visibility to Public

**Trivy scan fails**
- Review the Security tab in GitHub for CVE details
- Update base image or affected packages

**Tests fail with "command not found" errors**
- Verify test script uses `source /utils/test-utils.sh` (absolute path)
- Check Docker run command mounts test-utils: `-v $(pwd)/test/test-utils:/utils`

## Test Suite Examples

### simple-python Test Coverage

The `simple-python` image includes comprehensive testing covering 23 assertions:

**Development & Python (3 checks)**
- python installed and functional (3.13.11)
- pip installed and functional
- python code execution

**Version Control (1 check)**
- git installed (2.39.5)

**Build Tools (3 checks)**
- gcc installed (12.2.0)
- g++ installed (12.2.0)
- make installed (4.3)

**Utilities (4 checks)**
- curl installed (7.88.1)
- ssh installed (9.2p1)
- gpg installed (2.2.40)
- sudo installed (1.9.13p3)

**Shell & Text Processing (5 checks)**
- bash installed (5.2.15)
- grep available (3.8)
- sed available (4.9)
- awk available (working with `awk 'BEGIN { print "OK" }'`)
- find available (9.0)

**User Setup (2 checks)**
- vscode user exists (UID 1000)
- vscode has sudoer privileges

All 23 tests pass successfully on both linux/amd64 and linux/arm64 architectures.

## License

All images inherit the repository license (MIT).
