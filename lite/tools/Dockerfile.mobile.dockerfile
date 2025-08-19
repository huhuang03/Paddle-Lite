# A image for paddle lite mobile cross compile and simulator on android

FROM mingc/android-build-box
MAINTAINER PaddlePaddle Authors <paddle-dev@baidu.com>

RUN apt update && apt install -y \
        clang-format \
        curl \
        gcc \
        g++ \
        git \
        make \
        patchelf \
        python3 \
        android-tools-adb \
        python3-dev \
        python3-pip \
        python3-setuptools \
        unzip \
        vim \
        libc6-i386 \
        lib32stdc++6 \
        redir \
        iptables \
        openjdk-8-jre \
        default-jdk \
        g++-arm-linux-gnueabi \
        gcc-arm-linux-gnueabi \
        g++-arm-linux-gnueabihf \
        gcc-arm-linux-gnueabihf \
        gcc-aarch64-linux-gnu \
        g++-aarch64-linux-gnu \
        wget && \
        ln -sf /usr/bin/python3 /usr/bin/python && \
        ln -sf /usr/bin/pip3 /usr/bin/pip

# VNC port
EXPOSE 5900

# clean
#RUN pip install --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple wheel pre-commit
RUN apt-get autoremove -y && apt-get clean

ENV NDK_ROOT=/opt/android-sdk/ndk/29.0.13846066

WORKDIR /tools