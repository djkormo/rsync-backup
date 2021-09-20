FROM alpine:latest
LABEL maintainer="Wei Kin Huang"

RUN set -x \
    && apk add --no-cache \
        bash \
        openssh-client \
        rsync

RUN addgroup -S worker && adduser -D -h /home/worker -s /bin/bash worker -G worker

USER worker
WORKDIR /home/worker

COPY --chown=worker:worker container/ /

CMD [ "disk-backup.sh" ]
