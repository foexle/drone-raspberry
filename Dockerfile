FROM golang:stretch

ENV DEBIAN_FRONTEND noninteractive
ENV PACKER_LOG 1
ENV PACKER_DEV 1

RUN apt update && \
    apt install -y --no-install-recommends kpartx

WORKDIR /data
COPY vendor/ /data/
COPY create_image.sh /data/

RUN mkdir -p /root/.packer.d/plugins
RUN cd packer-builder-arm-image && \
    go build && \
    mv packer-builder-arm-image /root/.packer.d/plugins

RUN rm -f packer-builder-arm-image/

ENTRYPOINT ["/bin/bash","create_image.sh"]
