FROM nvidia/cuda:12.5.0-runtime-ubuntu20.04

ENV LANG C.UTF-8

# Install necessary packages
RUN add-apt-repository universe && apt-get update && \
    apt-get install -y software-properties-common git wget python3 python3-dev python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY . /code

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && pip install -r requirements.txt