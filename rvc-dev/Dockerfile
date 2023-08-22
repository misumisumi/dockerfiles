FROM docker.io/pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV LANG ja_JP.UTF-8
ENV PULSE_SERVER unix:/tmp/pulse/native

WORKDIR /app

COPY ./requirements.txt ./

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
        git \
        locales \
        portaudio19-dev \
        pulseaudio \
        alsa-utils \
        ffmpeg \
    apt clean && \
    locale-gen ja_JP.UTF-8 && \
    pip install -r requirements.txt