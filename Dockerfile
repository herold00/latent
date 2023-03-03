FROM node:12-alpine
RUN apk add --no-cache python3-dev musl-dev gcc linux-headers libev-dev
WORKDIR /app
COPY . .
RUN python3 -m ensurepip --upgrade
RUN pip3 install pdm
EXPOSE 80
