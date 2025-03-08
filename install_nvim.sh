#! /bin/bash

NVIM_VERSION=0.10.4
NVIM_ARCH=$1
NVIM_DIR=/usr/bin/nvim

if [ -z $NVIM_ARCH ]; then
    NVIM_ARCH=arm64
fi

# arch must be one of arm64, x86_64
if [ $NVIM_ARCH != "arm64" ] && [ $NVIM_ARCH != "x86_64" ]; then
    echo "Invalid architecture. Must be one of arm64, x86_64. Default is arm64."
    exit 1
fi

NVIM_FILE=nvim-linux-$NVIM_ARCH
NVIM_TAR=$NVIM_FILE.tar.gz
NVIM_URL=https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/$NVIM_TAR

# Download and extract nvim
curl -L $NVIM_URL -o $NVIM_TAR
tar -xzf $NVIM_TAR
rm $NVIM_TAR

# Move nvim to /usr/bin
mv $NVIM_FILE /usr/bin

# Create symlink to nvim
ln -s /usr/bin/$NVIM_FILE/bin/nvim $NVIM_DIR