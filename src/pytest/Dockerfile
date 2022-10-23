FROM python:slim

WORKDIR /app

COPY tests /app/tests

COPY requirements.txt /app/requirements.txt
COPY run.sh /app/run.sh

RUN apt-get update  && apt-get install -y tar \
  && pip install -r /app/requirements.txt

CMD "/app/run.sh"