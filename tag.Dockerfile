FROM comfyui_comfy:latest

ENV LANG C.UTF-8
ENV TZ=Asia/Shangha
# 设置环境变量，使用阿里云pip镜像源
ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
RUN python3.10 -m pip install --upgrade pip
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y libopencv-dev python3-opencv
RUN python3.10 -m pip install matplotlib onnxruntime scikit-image imageio-ffmpeg
