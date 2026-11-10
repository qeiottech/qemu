#!/bin/bash
# URL: https://github.com/bergercookie/asm-lsp
sudo apt install rustup
rustup update stable
cargo install asm-lsp
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
# for .asm-lsp.toml
# asm-lsp gen-config --help

# src
git clone https://github.com/bergercookie/asm-lsp.git
