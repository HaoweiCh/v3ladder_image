FROM bitnami/minideb:bullseye

RUN apt-get update -y && apt-get install -y curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

COPY app /usr/bin/app
WORKDIR /app

CMD ["app","help"]