#! /usr/bin/env bash
cd ../../voice-changer/server || exit

python3 MMVCServerSIO.py \
  -p 18888 \
  --https true \
  --hubert_base ../../pretrained/hubert_base \
  --hubert_base_jp ../../pretrained/hubert_base_jp \
  --hubert_soft ../../pretrained/hubert_soft \
  --nsf_hifigan ../../pretrained/nsf_hifigan \
  --model_dir ../../../results