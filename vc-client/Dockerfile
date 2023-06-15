FROM docker.io/pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV PULSE_SERVER unix:/tmp/pulse/native

WORKDIR /app

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
        git \
        locales \
        portaudio19-dev \
        pulseaudio \
        alsa-utils && \
    apt clean && \
    git clone https://github.com/w-okada/voice-changer && \
    cd voice-changer/server && \
    git clone https://github.com/isletennos/MMVC_Client.git MMVC_Client && \
    git clone https://github.com/liujing04/Retrieval-based-Voice-Conversion-WebUI RVC && \
    git clone https://github.com/yxlllc/DDSP-SVC DDSP-SVC && \
    pip install -r requirements.txt

WORKDIR /app/voice-changer/server

copy scripts/launch.sh launch.sh

CMD [ "/bin/bash", "launch.sh" ]