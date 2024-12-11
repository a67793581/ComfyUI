FROM comfy:latest

# ENV NUMBA_THREADING_LAYER_PRIORITY="omp tbb workqueue"
# # 使用阿里云的源替换默认源
# RUN sed -i 's@http://ports.ubuntu.com/ubuntu-ports@http://mirrors.aliyun.com/ubuntu-ports@g' /etc/apt/sources.list
# RUN sed -i 's@http://security.ubuntu.com/ubuntu@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list

# RUN python3.10 -m pip install --upgrade pip
# RUN apt-get update && apt-get install -y libopencv-dev python3-opencv

# RUN apt-get update && apt-get install -y gcc g++ make

# RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && apt-get install -y libtbb-dev


# RUN python3.10 -m pip install matplotlib onnxruntime scikit-image 
# RUN python3.10 -m pip install imageio-ffmpeg numba 
# RUN python3.10 -m pip install trimesh 
# RUN python3.10 -m pip install pydantic watchdog 
# RUN python3.10 -m pip install pyOpenSSL
# RUN python3.10 -m pip install omegaconf onnxruntime-gpu
#  RUN python3.10 -m pip install sniffio h11 exceptiongroup httpcore anyio httpx openai
#  RUN python3.10 -m pip install llama-cpp-python simple_lama_inpainting rembg[gpu] clip-interrogator
#  RUN python3.10 -m pip install opencv-python

# RUN apt-get update && \
#      apt-get install -y python3-gdbm  && \
#      apt-get clean && \
#      rm -rf /var/lib/apt/lists/*
# RUN python3.10 -m pip install sentencepiece addict tomesd segment-anything piexif keyframed toolz pytz py-cpuinfo tzdata pandas seaborn ultralytics-thop ultralytics lark-parser diffusers GitPython
# RUN python3.10 -m pip install etcd3
# RUN python3.10 -m pip install protobuf==3.20.3
# COPY . /root/comfyui_info/ComfyUI
# WORKDIR /root/comfyui_info/ComfyUI
# RUN python3.10 -m pip install -r requirements.txt