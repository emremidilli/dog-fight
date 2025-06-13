FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

LABEL maintainer="yunusemremidilli@gmail.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update
RUN apt-get install -y git

# Install JupyterLab and flake8
RUN pip install jupyterlab==4.3.4 jupyterlab-lsp==5.1.0

# Set JupyterLab dark theme
RUN jupyter lab --generate-config && \
    mkdir -p $(jupyter --config-dir)/lab/user-settings/@jupyterlab/apputils-extension && \
    echo '{ "theme": "JupyterLab Dark" }' > $(jupyter --config-dir)/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /tmp/requirements.txt

RUN rm -rf tensorflow-tutorials/

EXPOSE 8888

WORKDIR /workspace

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]