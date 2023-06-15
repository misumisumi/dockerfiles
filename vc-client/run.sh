#! /usr/bin/env bash
[[ ! -d ./pretrained/vc-client ]] && mkdir -p ./pretrained/vc-client
# [[ -f ./pretrained/vc-client/hubert_base ]] && curl https://huggingface.co/ddPn08/rvc-webui-models/resolve/main/embeddings/hubert_base.pt -o hubert_base
# [[ -f ./pretrained/vc-client/hubert_base_jp ]] && curl https://huggingface.co/rinna/japanese-hubert-base/resolve/main/fairseq/model.pt -o hubert_base_jp
# [[ -f ./pretrained/vc-client/hubert_soft ]] && curl https://huggingface.co/wok000/weights/resolve/main/ddsp-svc30/embedder/hubert-soft-0d54a1f4.pt -o hubert_soft
# [[ -f ./pretrained/vc-client/nsf_hifigan ]] && curl https://huggingface.co/wok000/weights/resolve/main/ddsp-svc30/nsf_hifigan_20221211/model.bin -o nsf_hifigan

podman run --runtime nvidia -it \
  -p 18888:18888 \
  -v /run/user/1000/pulse/pulpul:/tmp/pulse/native \
  -v "$(pwd)/pretrained/vc-client":/app/pretrained \
  -v "$(pwd)/../results/":/app/results \
  --shm-size=128M \
  --name vc-client \
  vc-client/pytorch:2.0.1