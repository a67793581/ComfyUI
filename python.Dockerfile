FROM comfy_base:latest

ENV LANG C.UTF-8
ENV TZ=Asia/Shangha
# 设置环境变量，使用阿里云pip镜像源
ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/

RUN add-apt-repository ppa:deadsnakes/ppa  && \
    apt-get install -y python3.10 python3.10-dev python3.10-distutils &&  \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* &&\
    wget https://mirrors.aliyun.com/pypi/get-pip.py && \
    python3.10 get-pip.py && \
    rm -rf get-pip.py

# 复制项目文件到容器中
COPY requirements.txt /code/requirements.txt

# 设置pip的镜像源并安装项目依赖
RUN python3.10 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
    python3.10 -m pip install -r requirements.txt && \
    # 如果不需要保留源代码，可以在安装完依赖后清理
    rm -rf /code/*