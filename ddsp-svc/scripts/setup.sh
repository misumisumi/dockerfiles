#! /usr/bin/env bash
[ ! -d ./pretrain/contentvec ] && mkdir -p ./pretrain/contentvec
ln -sf "$(pwd)"/../pretrained/hubert-soft*.pt ./pretrain/hubert
ln -sf "$(pwd)"/../pretrained/nsf_hifigan/* ./pretrain/nsf_hifigan
ln -sf "$(pwd)"/../pretrained/checkpoint_best*.pt ./pretrain/contentvec