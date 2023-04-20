FROM alpine:3.16

RUN apk --update add curl jq openvpn privoxy runit

WORKDIR /app

COPY app /app
COPY generate.sh /app
COPY riseup-ovpn.sample.conf /app

RUN /app/generate.sh

RUN curl -sSL https://github.com/jpillora/chisel/releases/download/v1.7.6/chisel_1.7.6_linux_amd64.gz | zcat > /bin/chisel
RUN chmod +x /bin/chisel

CMD ["runsvdir", "/app"]
