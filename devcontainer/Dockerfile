# -----------------------------------------------------------------------------
# Dockerfile for a Remote NeoVim Dev Container
# -----------------------------------------------------------------------------
# - Runs a pre-configured NeoVim instance
# - Includes SSH access for remote usage
# - Mounts files from your corporate laptop for editing
# -----------------------------------------------------------------------------

FROM ubuntu:latest

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    openssh-server \
    tmux \
    ripgrep \
    fzf \
    fd-find \
    chafa \
    python3 \
    python3-dev \
    python3-pip \
    python3-neovim \
    python3-pynvim \
    lua5.1 \
    lua5.1-dev \
    liblua5.1-dev \
    luarocks \
    libluajit-5.1-dev \
    pre-commit \
    make \
    sqlite3 \
    build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root

# Copy over install scripts
COPY ./install_node /root/install_node
COPY ./install_nvim /root/install_nvim

# Clone dotfiles repo
RUN git clone http://github.com/aaweaver-actuary/dotfiles /root/dotfiles && \
    cd /root/dotfiles && \
    cp /root/dotfiles/tmux.conf /root/.tmux.conf && \
    cp /root/dotfiles/install_dotfiles /usr/bin/install_dotfiles && \
    chmod +x /usr/bin/install_dotfiles && \
    rm -rf /root/dotfiles

# Clone neovim config
RUN git clone --depth 1 https://github.com/andy-weaver/.nvim.git /root/.config/nvim

# Copy .vimrc to /root/.vimrc
RUN cp /root/.config/nvim/.vimrc /root/.vimrc

# Install Python support for uv package manager
RUN pip install --break-system-packages uv pynvim neovim

# Configure SSH (enable root login)
RUN mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Generate SSH host keys (persistent)
RUN ssh-keygen -A

# Expose SSH port
EXPOSE 22

# # Run Neovim in headless mode to install plugins
# RUN nvim --headless "+Lazy! sync" +qa

# Create the .venv in the ./py directory
RUN cd /root/.config/nvim/py && \
    (uv init --name nvim || true) && \
    uv sync

# Configure the system locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV LC_CTYPE C.UTF-8

# Handle git issue 
RUN git config --global --add safe.directory '*'

# Default command: start SSH server
CMD ["/usr/sbin/sshd", "-D"]
