ARG imageVariant="latest"

FROM python:${imageVariant}

# update system packages
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --yes \
    zsh \
    fonts-powerline \
    git \
    curl \
    wget

# set zsh as default shell, install oh-my-zsh, create a .zshrc file
RUN usermod -s $(which zsh) root
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Create a .zshrc file with random Oh My Zsh theme
RUN cat <<EOF >> /root/.zshrc

# override default values on sample file with below
ZSH_THEME="random"
plugins=(git)

# enable tab completion for pipx
eval "$(register-python-argcomplete pipx)"
EOF

# python output i.e. the stdout and stderr streams are sent straight to terminal 
# (e.g. your container log) without being first buffered and that you can see 
# the output of your application (e.g. django logs) in real time.
# https://stackoverflow.com/a/59812588/5159551
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN python3 -m pip install --user pipx
ENV PATH="/root/.local/bin:${PATH}"
RUN python3 -m pipx ensurepath

# when requirements.txt contents rarely change, do below, so packages will be added during container build
# uncommenting this will create a new build image everytime devcontainer gets created. However, this build
# should be a common build for all containers, and install should be in postCreateCommand.
# https://mcr.microsoft.com/en-us/product/devcontainers/python/about
# COPY ../requirements.txt /tmp/pip-tmp/
# RUN python -m pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#     && rm -rf /tmp/pip-tmp

CMD ["/bin/zsh"]