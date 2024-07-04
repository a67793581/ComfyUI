FROM nvidia/cuda:12.5.0-base-ubuntu22.04

ENV LANG C.UTF-8

# 更新软件包列表，安装基础工具、添加PPA、安装所有需要的软件包，最后清理
RUN apt-get update && \
    apt-get install -y software-properties-common  apt-utils && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg git wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
