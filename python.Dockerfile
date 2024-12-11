FROM comfy_base:latest
# 设置环境变量，使用阿里云pip镜像源
ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/

RUN add-apt-repository ppa:deadsnakes/ppa  && \
    apt-get install -y python3.10 python3.10-dev python3.10-distutils &&  \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* &&\
    wget https://mirrors.aliyun.com/pypi/get-pip.py && \
    python3.10 get-pip.py && \
    rm -rf get-pip.py