FROM node:12-alpine
RUN apk add --no-cache python3-dev musl-dev gcc linux-headers libev-dev caddy
COPY . .
RUN python3 -m ensurepip --upgrade
RUN pip3 install pdm
RUN mkdir /usr/local/srv
RUN cd /usr/local/srv
RUN mkdir nz0
RUN cd nz0
RUN pdm init -n
RUN pdm add wagtail
RUN python3 wagtail start nz0
RUN cd nz0
RUN pdm run python manage.py migrate
RUN pdm run python manage.py createsuperuser --username heroldzer0 --email 00@node00.net
RUN SECRET ENV Password
RUN echo "secret is: $Password"
EXPOSE 80
