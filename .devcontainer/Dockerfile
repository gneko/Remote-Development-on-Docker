FROM ubuntu:18.04
ENV USER=deploy
ENV PASSWD=deploy
ENV WORKDIR=projects

# 替换为阿里云镜像，如不需要可以去掉本部分
RUN printf '\n\
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' > /etc/apt/sources.list

# 安装开发环境必要的包
RUN apt-get update \
  && apt-get install -y ssh openssh-server build-essential \
    gcc g++ gdb gdbserver cmake \
    # 无需libboost可以去掉下一行
    libboost-dev \
    # net-tools 提供了ifconfig
    net-tools tar rsync \
    # 无需python3可以去掉下一行
    python3 python3-pip \
    sudo git\
  && apt-get clean

# 添加用户并配置密码
RUN useradd -m ${USER} && yes ${PASSWD} | passwd ${USER}

# 赋予sudo权限并允许无密码sudo
RUN echo ${USER}' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chmod 644 /etc/sudoers

CMD ["/usr/sbin/sshd", "-D"]

USER ${USER}
RUN mkdir -p /home/${USER}/${WORKDIR}/
ENV LC_ALL C.UTF-8