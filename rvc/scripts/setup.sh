#! /usr/bin/env bash

ln -sf "$(pwd)"/../weights/hubert_base.pt ./assets/hubert/hubert_base.pt
ln -sf "$(pwd)"/../weights/rmvpe.pt ./assets/rmvpe/rmvpe.pt
find ../weights/uvr5_weights/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/uvr5_weights/{} ./assets/uvr5_weights/
find ../weights/pretrained/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./assets/pretrained
find ../weights/pretrained_v2/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained_v2/{} ./assets/pretrained_v2
# ln -sf "$(pwd)"/../weights/thirdparty/mute ./logs/

# find ../weights/uvr5_weights/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/uvr5_weights/{} ./uvr5_weights/
# find ../weights/pretrained/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./pretrained
# find ../weights/pretrained_v2/ -type f -printf "%f\n" | xargs -I{} ln -sf "$(pwd)"/../weights/pretrained/{} ./pretrained