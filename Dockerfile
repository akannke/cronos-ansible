FROM ubuntu:focal

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl 

WORKDIR /root/cronos

RUN curl -LOJ https://github.com/crypto-org-chain/cronos/releases/download/v0.6.1/cronos_0.6.1_Linux_x86_64.tar.gz

RUN tar -zxvf cronos_0.6.1_Linux_x86_64.tar.gz

RUN mv /root/cronos/bin/cronosd /usr/local/bin

WORKDIR /root

RUN rm -r ./cronos

