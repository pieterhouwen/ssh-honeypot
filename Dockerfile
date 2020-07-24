FROM ubuntu:18.04
COPY . /temp
RUN alias wget='wget --no-check-certificate'
RUN apt purge openssl -y
RUN apt install build-essential gcc glibc-source -y
