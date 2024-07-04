FROM nvidia/cuda:12.5.0-base-ubuntu22.04

ENV LANG C.UTF-8

# 更新软件包列表，安装基础工具、添加PPA、安装所有需要的软件包，最后清理
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg git wget python3.10 python3.10-dev python3.10-distutils python3.10-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 这里实现"做一层镜像隔离"，即在所有基础依赖安装后创建新的镜像层
FROM nvidia/cuda:12.5.0-base-ubuntu22.04 AS build-env

ENV LANG C.UTF-8

COPY --from=0 / /

WORKDIR /code

# 复制项目文件到容器中
COPY . /code

# 设置pip的镜像源并安装项目依赖
RUN pip3.10 config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    pip3.10 install -r requirements.txt && \
    # 如果不需要保留源代码，可以在安装完依赖后清理
    rm -rf /code/*