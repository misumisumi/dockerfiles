#! /usr/bin/env bash
nix develop
[[ ! -d .venv ]] && python3 -m venv .venv]]
source .venv/bin/activate
cd ../../voice-changer/server || exit

python3 MMVCServerSIO.py \
  -p 18888 \
  --https true \
  --hubert_base ../../pretrained/hubert_base \
  --hubert_base_jp ../../pretrained/hubert_base_jp \
  --hubert_soft ../../pretrained/hubert_soft \
  --nsf_hifigan ../../pretrained/nsf_hifigan \
  --model_dir ../../../results