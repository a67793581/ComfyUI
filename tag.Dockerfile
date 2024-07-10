FROM comfy:7.0

ENV LANG C.UTF-8
ENV TZ=Asia/Shangha
ENV NUMBA_THREADING_LAYER_PRIORITY="omp tbb workqueue"
# 设置环境变量，使用阿里云pip镜像源
ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
# 使用阿里云的源替换默认源
RUN sed -i 's@http://ports.ubuntu.com/ubuntu-ports@http://mirrors.aliyun.com/ubuntu-ports@g' /etc/apt/sources.list
RUN sed -i 's@http://security.ubuntu.com/ubuntu@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list

#RUN python3.10 -m pip install --upgrade pip
#RUN apt-get update && \
#    export DEBIAN_FRONTEND=noninteractive && \
#    apt-get install -y --no-install-recommends tzdata && \
#    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
#    dpkg-reconfigure -f noninteractive tzdata && \
#    apt-get install -y libopencv-dev python3-opencv && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

#RUN apt-get update && \
#    apt-get install -y gcc g++ make  && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

#RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && apt-get install -y libtbb-dev


#RUN python3.10 -m pip install matplotlib onnxruntime scikit-image imageio-ffmpeg numba trimesh pydantic watchdog pyOpenSSL
#RUN python3.10 -m pip install omegaconf onnxruntime-gpu
#RUN python3.10 -m pip install sniffio h11 exceptiongroup httpcore anyio httpx openai
#RUN python3.10 -m pip install llama-cpp-python simple_lama_inpainting rembg[gpu] clip-interrogator
#RUN python3.10 -m pip install opencv-python
#RUN python3.10 -m pip install --upgrade tbb

WORKDIR /root/comfyui_info/ComfyUI