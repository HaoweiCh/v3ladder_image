rm -f v2ray-linux-amd64.zip v2ray v2ctl *.dat;
wget https://github.com/v2ray/v2ray-core/releases/download/v4.20.0/v2ray-linux-64.zip -O v2ray-linux-amd64.zip && \
unzip v2ray-linux-amd64.zip "v2ray" "v2ctl" "geoip.dat" "geosite.dat";
chmod +w v2ray v2ctl && upx v2ray v2ctl;