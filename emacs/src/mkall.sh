#!/bin/bash
./autogen.sh
# sudo apt install texinfo 
# sudo apt install libgnutls28-dev libgccjit-14-dev
./configure --without-x
# sudo apt install pipx
# pipx install compiledb
# compiledb -n make
bear -- make -j$(nproc)
sudo make install -s

emacs
# emacs ~/.emacs
# M-x elisp-enable-lexical-binding RET
