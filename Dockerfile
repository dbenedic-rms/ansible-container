FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y build-essential libssl-dev libffi-dev curl wget iputils-ping \
    && apt-get install -y python python-dev python-pip python-virtualenv \ 
    && apt-get install -y -qq krb5-user libkrb5-dev \
    && apt-get install -y nodejs npm \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install -q ansible msrestazure azure==2.0.0rc5 netaddr ansible-lint \
    && pip install -q kerberos pywinrm

RUN npm install -g grunt grunt-cli

WORKDIR /npm
COPY files/* /npm/
RUN npm install

WORKDIR /ansible

CMD ["/bin/bash"]
