FROM debian:stretch-slim
ADD v2ray /etc/v2ray/v2ray
ADD v2ctl /etc/v2ray/v2ctl
ADD geoip.dat /etc/v2ray/
ADD geosite.dat /etc/v2ray/
WORKDIR /etc/v2ray/
CMD ["./v2ray -config config.json"]