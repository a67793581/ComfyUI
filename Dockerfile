FROM nvidia/cuda:12.5.0-base-ubuntu20.04

ENV LANG C.UTF-8

# Install necessary packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg python3.10 python3.10-dev python3.10-distutils python3.10-venv && \
    ln -sf /usr/bin/python3.10 /usr/bin/python3 && \
    ln -sf /usr/bin/pip3.10 /usr/bin/pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /code

COPY . /code

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    pip install -r requirements.txt && \
    rm -rf /code/*