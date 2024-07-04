FROM nvidia/cuda:12.5.0-base-ubuntu22.04

ENV LANG C.UTF-8

# 更新软件包列表
RUN apt-get update && apt-get install -y software-properties-common

# 添加Dead Snakes PPA以安装Python 3.10
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update

# 安装FFmpeg和Python 3.10及其开发工具
RUN apt-get install -y ffmpeg git wget
RUN apt-get install -y python3.10 python3.10-dev python3.10-distutils python3.10-venv

# 创建符号链接使得python3和pip指向Python 3.10版本
RUN ln -sf /usr/bin/python3.10 /usr/bin/python3 && ln -sf /usr/bin/pip3.10 /usr/bin/pip

# 清理缓存并删除下载的包文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/*



WORKDIR /code

COPY . /code

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    pip install -r requirements.txt && \
    rm -rf /code/*