FROM ubuntu:18.04

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
      rsync tar \
      python3 python3-pip libboost-dev \
      sudo \
  && apt-get clean

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

RUN useradd -m deploy \
  && yes deploy | passwd deploy

RUN echo 'deploy ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN chmod 644 /etc/sudoers

CMD ["/usr/sbin/sshd", "-D"]

RUN mkdir -p /home/deploy/projects/
ENV LC_ALL C.UTF-8

