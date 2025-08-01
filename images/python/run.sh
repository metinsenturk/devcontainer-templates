args=(
    # Always attempt to pull a newer version of the image
    --pull
    # Remove intermediate containers after a successful build
    --rm
    # Name of the Dockerfile (Default is PATH/Dockerfile)
    -f "Dockerfile"
    # Name and optionally a tag in the name:tag format
    -t simple-python:latest
)

# more on https://docs.docker.com/reference/cli/docker/image/build/
docker build "${args[@]}" .
