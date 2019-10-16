FROM debian:stretch-slim
ADD v2ray /v2ray/v2ray
WORKDIR /v2ray
CMD ["./v2ray -version"]