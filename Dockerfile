FROM ubuntu:18.04
COPY . /tmp/
RUN apt update
RUN apt install wget -y
RUN alias wget='wget --no-check-certificate'
RUN apt purge openssl -y
RUN apt install build-essential gcc glibc-source make -y
RUN bash prep.sh
