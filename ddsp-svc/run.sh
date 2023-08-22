#! /usr/bin/env bash
[ ! -d ../../DDSP-SVC ] && git clone https://github.com/yxlllc/DDSP-SVC ../../DDSP-SVC
[ ! -d ../../pretrained/ddsp-svc ] && mkdir -p ../../pretrained/ddsp-svc && git clone https://huggingface.co/datasets/ms903/Diff-SVC-refactor-pre-trained-model ../../pretrained/ddsp-svc/refactor
echo "Please download pretrained models for 'contentvec', 'hubertsoft' and 'NFS-HiFiGAN'"
[ ! -d ../../../results/ddsp-svc ] && mkdir -p ../../../results/ddsp-svc
[ ! -d ../../../outputs/ddsp-svc ] && mkdir -p ../../../outputs/ddsp-svc

podman run --runtime nvidia -it \
  -p 7865:7865 \
  -v /run/user/1000/pulse/pulpul:/tmp/pulse/native \
  -v "$(pwd)/../../DDSP-SVC":/app/DDSP-SVC \
  -v "$(pwd)/../../pretrained/ddsp-svc":/app/pretrained \
  -v "$(pwd)/../../../results/ddsp-svc":/app/results \
  -v "$(pwd)/../../../outputs/ddsp-svc":/app/outputs \
  -v "$(pwd)/../../../datasets":/app/datasets \
  -v "$(pwd)/scripts":/app/scripts \
  -w /app/DDSP-SVC \
  --shm-size=4g \
  --name ddsp-svc \
  ddsp-svc/pytorch:2.0.1 \
  bash