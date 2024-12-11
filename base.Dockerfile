FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu20.04

ENV LANG=C.UTF-8
ENV TZ=Asia/Shangha
ENV DEBIAN_FRONTEND=noninteractive
# 更新软件包列表，安装基础工具、添加PPA、安装所有需要的软件包，最后清理

RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils tzdata && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg git wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 自动设置时区为 Asia/Shanghai
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata