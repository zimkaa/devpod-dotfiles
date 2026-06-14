#!/bin/bash

mkdir -p "$HOME/src"
git clone https://github.com/sxyazi/yazi.git "$HOME/src/yazi"
(cd "$HOME/src/yazi" &&\
  cargo build --release --locked &&\
  sudo mv target/release/yazi target/release/ya /usr/local/bin/
)
