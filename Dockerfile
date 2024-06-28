FROM nvidia/cuda:12.5.0-base-ubuntu20.04

ENV LANG C.UTF-8

# Install necessary packages
RUN apt-get update && apt-get install -y \
        software-properties-common \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install python3
RUN apt-get update && \
    apt-get install -y python3 python3-dev python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 将你的应用程序代码复制到容器中（这里假设你的代码位于当前目录下的 app 文件夹）
COPY . /app

# 安装应用所需的 Python 包（如果有的话，根据实际需求替换 <your_requirements_file>）
RUN pip  install -r /app/requirements.txt

# 定义启动命令（以你的应用启动脚本或命令替换）
 CMD ["python", "/app/main.py --use-split-cross-attention --highvram"]