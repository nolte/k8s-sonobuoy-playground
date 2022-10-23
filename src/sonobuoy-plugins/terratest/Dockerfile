FROM golang:1.16

ARG tf_version=1.3.3

RUN apt-get update && apt-get install -y gnupg software-properties-common curl \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update \
    && apt-get install -y terraform=${tf_version} \
        git

#WORKDIR $GOPATH/src/app/test/
#RUN echo $GOPATH
#COPY tf-hello-world $GOPATH/src/app/tf-hello-world
#COPY test $GOPATH/src/app/test
COPY run.sh /app/run.sh

ENTRYPOINT ["/app/run.sh"]
