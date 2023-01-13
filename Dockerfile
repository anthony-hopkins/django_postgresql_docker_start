FROM python:3.9-alpine3.13
LABEL maintainer="https://github.com/anthony-hopkins"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./<APP> /<APP>
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
WORKDIR /<APP>
EXPOSE 8000


RUN pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps build-base postgresql-dev musl-dev && \
    pip install -r /tmp/requirements.txt && \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser --disabled-password --no-create-home django-user

USER django-user
