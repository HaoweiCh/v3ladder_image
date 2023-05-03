FROM bitnami/minideb:bullseye

RUN echo "deb http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free" > /etc/apt/sources.list && \
apt-get update -y \
&& apt-get install --no-install-recommends -y curl wget openssl ca-certificates apt-utils \
&& apt-get upgrade -y\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

COPY app /app/app

CMD ["app","help"]