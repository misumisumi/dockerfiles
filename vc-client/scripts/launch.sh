#! /usr/bin/env bash
python3 MMVCServerSIO.py \
  -p 18888 \
  --https true \
  --hubert_base /app/pretrained/hubert_base \
  --hubert_base_jp /app/pretrained/hubert_base_jp \
  --hubert_soft /app/pretrained/hubert_soft \
  --nsf_hifigan /app/pretrained/nsf_hifigan \
  --model_dir /app/results