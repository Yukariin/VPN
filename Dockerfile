FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y qrencode \
        shadowsocks-libev shadowsocks-v2ray-plugin \
        nginx-light \
    && apt autoremove -y \
    && apt clean -y

COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
RUN tar xvf /wwwroot/wwwroot.tar.gz -C /wwwroot && rm -rf /wwwroot/wwwroot.tar.gz \
    && chmod +x /entrypoint.sh

CMD /entrypoint.sh
