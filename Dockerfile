# Base image for CUDA 11.8 and cuDNN 8
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Install Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        git \
        wget \
        gnupg \
        curl \
        build-essential \
        libffi-dev \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev

# Install Python 3.11.4
RUN wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tar.xz \
    && tar xvf Python-3.11.4.tar.xz \
    && cd Python-3.11.4 \
    && ./configure --prefix=/opt/python3.11 --enable-optimizations --with-ensurepip=install \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.11.4 Python-3.11.4.tar.xz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV PATH /opt/python3.11/bin:$PATH

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    /opt/python3.11/bin/python3.11 get-pip.py && \
    rm get-pip.py
RUN /opt/python3.11/bin/pip --version

# Setup Poetry
RUN /opt/python3.11/bin/pip install poetry
COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install
ENV PATH /root/.cache/pypoetry/virtualenvs/audiocraft-docker-9TtSrW0h-py3.11/bin:$PATH

# Set working directory
WORKDIR /app
