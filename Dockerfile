FROM continuumio/miniconda3

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
    git \
    build-essential \
    libc6-dev \
    zlib1g-dev && \
    apt-get clean && \
    apt-get purge

RUN conda config --add channels conda-forge && \
    conda install -y \
    python=3.11.4 \
    jupyter=1.0.0 \
    notebook=6.5.4 \
    numpy=1.25.2 \
    pandas=2.1.0 \
    natsort=8.4.0 \
    pip=23.2.1

RUN pip install number-parser==0.3.2

RUN pip install gnomad==0.6.4

RUN pip install gnomad-db==0.1.2
