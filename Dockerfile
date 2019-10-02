FROM tensorflow/tensorflow:latest-py3-jupyter

RUN pip install --upgrade pip

COPY jupyter_notebook_config.json /root/.jupyter/
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
