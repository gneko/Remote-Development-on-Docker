FROM ubuntu:18.04
ENV USER=deploy
ENV PASSWD=deploy
ENV WORKDIR=projects

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

RUN apt-get update \
  && apt-get install -y ssh openssh-server build-essential \
      gcc g++ gdb gdbserver cmake \
      net-tools tar \
      python3 python3-pip libboost-dev \
      sudo git\
  && apt-get clean


RUN useradd -m ${USER} \
  && yes ${PASSWD} | passwd ${USER}

RUN echo '${USER} ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN chmod 644 /etc/sudoers

CMD ["/usr/sbin/sshd", "-D"]

RUN mkdir -p /home/${USER}/${WORKDIR}/
ENV LC_ALL C.UTF-8

