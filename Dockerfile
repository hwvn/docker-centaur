FROM python:3.6-alpine

RUN set -ex \
    && apk add --no-cache --update \
    gcc \
    make \
    libc-dev \
    musl-dev \
    linux-headers \
    pcre-dev \
    libffi-dev \
    postgresql-dev \
    python3-dev \
    libmagic \
    git \
    curl \
  && rm -rf /var/cache/apk/* 

RUN pip install uwsgi

RUN curl https://bootstrap.pypa.io/get-pip.py | python

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
