FROM node:12-alpine
RUN apk add --no-cache python3-dev musl-dev gcc linux-headers libev-dev caddy
COPY . .
RUN python3 -m ensurepip --upgrade
RUN mkdir /usr/local/srv
RUN pip3 install pdm
RUN pdm init
RUN pdm add wagtail
RUN cd /usr/local/srv
RUN pdm run wagtail start node00
EXPOSE 80
