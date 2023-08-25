#! /usr/bin/env bash

ln -sf "$(pwd)"/../weights/hubert_base.pt ./
ln -sf "$(pwd)"/../weights/rmvpe.pt ./
ln -sf "$(pwd)"/../weights/thirdparty/mute ./logs/

find ../weights/uvr5_weights/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/uvr5_weights/{} ./uvr5_weights/
find ../weights/pretrained/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./pretrained
find ../weights/pretrained_v2/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./pretrained