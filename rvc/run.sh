#! /usr/bin/env bash
[[ ! -d ../outputs/rvc ]] && mkdir -p ../outputs/rvc
pushd ../../
podman run --runtime nvidia -it \
  -p 7865:7865 \
  -v /run/user/1000/pulse/pulpul:/tmp/pulse/native \
  -v "$(pwd)/Retrieval-based-Voice-Conversion-WebUI":/app/rvc \
  -v "$(pwd)/pretrained/rvc":/app/weights \
  -v "$(pwd)/../outputs/rvc":/app/outputs \
  -v "$(pwd)/../datasets":/app/original \
  -v "$(pwd)/dockerfiles/rvc/scripts":/app/scripts \
  -w /app/rvc \
  --shm-size=4g \
  --name rvc \
  rvc/pytorch:2.0.1 \
  python infer-web.py
popd
