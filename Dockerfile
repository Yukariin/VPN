FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode \
    && apt install -y shadowsocks-libev shadowsocks-v2ray-plugin \
    && apt install -y nginx-light \
    && apt autoremove -y \
    && apt clean -y

COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
