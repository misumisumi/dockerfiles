#! /usr/bin/env bash

ln -sf "$(pwd)"/../pretrained/ddsp-svc/pretrain/hubert/* ./pretrain/hubert
ln -sf "$(pwd)"/../pretrained/ddsp-svc/pretrain/nfs_hifigan/* ./pretrain/nfs_hifigan
ln -sf "$(pwd)"/../pretrained/ddsp-svc/pretrain/checkpoint_best_legacy_500.pt ./pretrain/