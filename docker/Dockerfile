FROM bitnami/minideb:bullseye

RUN apt-get update -y \
&& apt-get install -y curl \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

COPY app /usr/bin/app

CMD ["app","help"]