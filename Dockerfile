FROM nvidia/cuda:12.5.0-base-ubuntu22.04

ENV LANG C.UTF-8

# 更新软件包列表，安装基础工具、添加PPA、安装所有需要的软件包，最后清理
RUN apt-get update && \
    apt-get install -y software-properties-common  apt-utils && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg git wget python3.10 python3.10-dev python3.10-distutils python3.10-venv&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3.10 get-pip.py && \
    rm -rf get-pip.py

WORKDIR /code

# 复制项目文件到容器中
COPY requirements.txt /code/requirements.txt

# 设置pip的镜像源并安装项目依赖
RUN python3.10 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    python3.10 -m pip install -r requirements.txt && \
    # 如果不需要保留源代码，可以在安装完依赖后清理
    rm -rf /code/*