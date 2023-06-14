#! /usr/bin/env bash

podman run --runtime nvidia -it \
  -p 7865:7865 \
  -v /run/user/1000/pulse/pulpul:/tmp/pulse/native \
  -v "$(pwd)/Retrieval-based-Voice-Conversion-WebUI":/app/rvc \
  -v "$(pwd)/rvc_weights":/app/weights \
  -v "$(pwd)/../results/rvc":/app/results \
  -v "$(pwd)/../datasets/48k":/app/datasets/48k \
  -v "$(pwd)/dockerfiles/rvc/scripts":/app/scripts \
  -w /app/rvc \
  --shm-size=4g \
  --name rvc \
  rvc/pytorch:2.0.1 \
  python infer-web.py