FROM node:20-alpine3.17

RUN apk update && apk add --no-cache --upgrade bash && apk add nano

RUN curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

RUN npm install -g newman newman-reporter-html


WORKDIR /etc/newman

# ENTRYPOINT ["newman"]

ENTRYPOINT [ "tail", "-f", "/dev/null" ]