FROM tensorflow/tensorflow:latest-py3-jupyter

RUN apt update -y && apt install -y \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY jupyter_notebook_config.json /root/.jupyter/
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
