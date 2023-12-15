FROM nvidia/cuda:11.7.1-devel-ubuntu22.04
ARG DEBIAN_FRONTEND=noninteractive

# Install system packages, dependencies for pycairo, and Python 3.10
RUN apt-get update && apt-get install -y \
    git \
    curl \
    software-properties-common \
    libcairo2-dev \
    libgirepository1.0-dev \
    pkg-config \
    python3.10-dev \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt install -y python3.10 \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Copy the requirements.txt file into the container at /tmp
COPY requirements.txt /tmp/

# Install the Python packages from the requirements.txt file
RUN python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install -r /tmp/requirements.txt

# Download the punkt tokenizer using NLTK
RUN python3.10 -c "import nltk; nltk.download('punkt')"
