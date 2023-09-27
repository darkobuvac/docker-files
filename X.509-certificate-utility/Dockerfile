FROM alpine:latest

RUN apk update && apk add --no-cache openssl && rm -rf "/var/cache/apk/*"

WORKDIR /home

COPY ./ .

ENTRYPOINT [ "sh" ]