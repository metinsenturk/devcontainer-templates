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
        zsh \
        pipx \
    && rm -rf /var/lib/apt/lists/*

# === Create Non-Root User ===
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/zsh $USERNAME

# === Configure Sudoers ===
RUN echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# === Install Starship ===
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# === Set User Environment ===
USER $USERNAME
WORKDIR /workspace

# === Configure Zsh with Starship ===
RUN echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# === Install Pipx Packages ===
RUN pipx install virtualenv && \
    pipx install autopep8 && \
    pipx install black && \
    pipx install ruff && \
    pipx install flake8 && \
    pipx install mypy && \
    pipx install isort && \
    pipx install pylint && \
    pipx install pipenv && \
    pipx install poetry && \
    pipx install tox && \
    pipx install nox

# === Update PATH for Pipx Binaries ===
ENV PATH="/home/vscode/.local/bin:${PATH}"

CMD ["/bin/zsh"]
