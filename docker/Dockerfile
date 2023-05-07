FROM bitnami/minideb:bullseye

WORKDIR /app

RUN echo "deb http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free\ndeb-src http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free" > /etc/apt/sources.list && \
apt-get update -y && apt-get install --no-install-recommends -y wget openssl ca-certificates apt-utils && \
apt-get upgrade -y && apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
wget -q https://github.com/v2fly/geoip/raw/release/geoip.dat -O geoip.dat && \
wget -q https://github.com/v2fly/geoip/raw/release/geoip-only-cn-private.dat -O geoip-only-cn-private.dat && \
wget -q https://github.com/v2fly/domain-list-community/raw/release/dlc.dat -O geosite.dat

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

COPY app /app/app

CMD ["app","help"]