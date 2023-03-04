FROM node:12-alpine
RUN apk -U upgrade --available
RUN apk add --no-cache python3-dev musl-dev gcc linux-headers libev-dev caddy
COPY . .
RUN python3 -m ensurepip --upgrade
RUN pip3 install pdm
RUN mkdir /usr/local/srv
RUN cd /usr/local/srv
RUN mkdir node00
RUN cd node00
RUN pdm init -n
RUN pdm add wagtail
RUN pdm run wagtail start myproject
RUN cd myproject
RUN pwd
RUN ls
RUN pdm run python3 ./manage.py migrate
RUN pdm run python3 ./manage.py createsuperuser --username heroldzer0 --email 00@node00.net
RUN SECRET ENV DJANGO_SUPERUSER_PASSWORD
RUN echo "secret is: $DJANGO_SUPERUSER_PASSWORD"
EXPOSE 80
