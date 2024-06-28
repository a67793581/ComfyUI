FROM nvidia/cuda:12.4.0-base-centos7

# 更新系统包并安装依赖
RUN #yum update -y && \
#    yum install -y epel-release && \
#    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
#    yum install -y gcc make automake gcc-c++ zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel libcurl-devel python36-devel python36u-pip && \
#    yum clean all

# 安装 Python 3.10 通过 IUS 社区仓库提供的 python310u 包
RUN yum install -y python310u python310u-pip

# 设置默认的 Python 版本为 Python 3.10
RUN alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# 安装 pip 的最新版本
RUN python3.10 -m pip install --upgrade pip

# 设置工作目录
WORKDIR /app

# 将你的应用程序代码复制到容器中（这里假设你的代码位于当前目录下的 app 文件夹）
COPY . /app

# 安装应用所需的 Python 包（如果有的话，根据实际需求替换 <your_requirements_file>）
RUN pip3.10 install -r /app/requirements.txt

# 定义启动命令（以你的应用启动脚本或命令替换）
 CMD ["python3.10", "/app/main.py --use-split-cross-attention --highvram"]