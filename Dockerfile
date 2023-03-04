FROM node:12-alpine
RUN apk -U upgrade --available
RUN apk add --no-cache python3-dev musl-dev gcc linux-headers libev-dev caddy
COPY . .
RUN python3 -m ensurepip --upgrade
RUN pip3 install pdm
RUN pdm add wagail
RUN mkdir /usr/local/srv
RUN cd /usr/local/srv
RUN mkdir nzerozero
RUN cd nzerozero
RUN pdm init -n
RUN pdm run wagtail start nzerozero
RUN cd nzerozero
RUN pdm run python manage.py migrate
RUN pdm run python manage.py createsuperuser --username heroldzer0 --email 00@node00.net
RUN SECRET ENV Password
RUN echo "secret is: $Password"
EXPOSE 80
