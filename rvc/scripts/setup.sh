#! /usr/bin/env bash

ln -sf "$(pwd)"/../weights/hubert_base.pt ./
find ../weights/uvr5_weights/ -print0 | xargs -I{} ln -sf "$(pwd)"/../weights/uvr5_weights/{} ./uvr5_weights/
find ../weights/pretrained/ -print0 | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./pretrained