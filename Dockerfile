FROM ubuntu:18.04
COPY . /tmp/
RUN bash /tmp/prep.sh
CMD tail -f /dev/null
