#!/bin/bash

NODE_VERSION="22.14.0"
NODE_FOLDER="node-v${NODE_VERSION}-linux-x64"
TAR_EXT=".tar.xz"
NODE_FILENAME="${NODE_FOLDER}${TAR_EXT}"
NODE_URL="https://nodejs.org/dist/v${NODE_VERSION}/${NODE_FILENAME}"

SAVE_PATH="${HOME}/${NODE_FILENAME}"
MOVE_PATH="/usr/bin/${NODE_FOLDER}"

# Download with curl
curl -L $NODE_URL -o $SAVE_PATH

# Extract
chmod +x $SAVE_PATH
tar -xJf $SAVE_PATH

# Move folder /usr/bin/
mv $SAVE_PATH $MOVE_PATH \
|| mv $SAVE_PATH $MOVE_PATH \
|| { echo "install - loc1 - Failed to move the folder to /usr/bin. Exiting."; exit 1; }

# Link binary to /usr/bin/node
ln -s "${MOVE_PATH}/bin/node" "/usr/bin/node" \
|| ln -s "${MOVE_PATH}/bin/node" "/usr/bin/node" \
|| { echo "install - loc2 - Failed to link the binary to /usr/bin/node. Exiting."; exit 1; }
