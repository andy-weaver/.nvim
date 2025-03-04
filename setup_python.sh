#!/bin/bash
python3 -m pip install --user --upgrade pip
python3 -m pip install --user uv

cd ~/.config/nvim/py &&
  rm -rf ~/.config/nvim/py/.venv &&
  python3 -m uv sync

cd ~/.config/nvim
