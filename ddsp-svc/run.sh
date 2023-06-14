#! /usr/bin/env bash

podman run --runtime nvidia -it \
  -p 7865:7865 \
  -v /run/user/1000/pulse/pulpul:/tmp/pulse/native \
  -v "$(pwd)/DDSP-SVC":/app/DDSP-SVC \
  -v "$(pwd)/pretrained/ddsp-svc":/app/pretrained \
  -v "$(pwd)/../results/rvc":/app/results \
  -v "$(pwd)/../datasets/48k":/app/datasets/48k \
  -v "$(pwd)/dockerfiles/ddsp-svc/scripts":/app/scripts \
  -w /app/DDSP-SVC \
  --shm-size=4g \
  --name ddsp-svc \
  ddsp-svc/pytorch:2.0.1 \
  bash