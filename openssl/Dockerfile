FROM alpine:latest

RUN apk update && apk add --no-cache openssl && rm -rf "/var/cache/apk/*"
RUN apk update && apk add --no-cache --upgrade bash && apk add nano

WORKDIR /home

COPY ./openssl .

ENTRYPOINT [ "tail", "-f", "/dev/null" ]