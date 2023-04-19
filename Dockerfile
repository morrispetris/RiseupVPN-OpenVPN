FROM alpine:3.16

RUN apk --update add curl jq openvpn privoxy runit

WORKDIR /app

COPY app /app
COPY generate.sh /app
COPY riseup-ovpn.sample.conf /app

RUN /app/generate.sh

EXPOSE 8080

CMD ["runsvdir", "/app"]
