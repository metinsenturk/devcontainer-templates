FROM python:3.13-slim-bookworm

LABEL org.opencontainers.image.title="simple-python"
LABEL org.opencontainers.image.description="Minimal Python development image"
LABEL org.opencontainers.image.version="3.13"
LABEL org.opencontainers.image.source="https://github.com/metinsenturk/devcontainer-templates"
LABEL org.opencontainers.image.licenses="MIT"

# === Install Essential System Tools ===
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        ca-certificates \
        openssh-client \
        gnupg \
        build-essential \
        sudo \
    && rm -rf /var/lib/apt/lists/*

# === Create Non-Root User ===
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# === Configure Sudoers ===
RUN echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# === Set User Environment ===
USER $USERNAME
WORKDIR /workspace

CMD ["/bin/bash"]
