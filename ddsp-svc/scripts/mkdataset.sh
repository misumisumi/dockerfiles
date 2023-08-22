#! /usr/bin/env bash
# Please run under WORKDIR of define of Dockerfile

find "$PWD"/../datasets/44.1kHz/ -type d | sort | while read -r dir; do
  find "$dir" -name "*.wav" | head -n500 | xargs -I{} ln -sf {} "$dir"/
done