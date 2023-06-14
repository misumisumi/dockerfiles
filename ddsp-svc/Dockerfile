FROM docker.io/pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV PULSE_SERVER unix:/tmp/pulse/native

WORKDIR /app

COPY ./requirements.txt ./

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
        portaudio19-dev \
        pulseaudio \
        alsa-utils && \
    apt clean && \
    pip install -r requirements.txt