FROM node:20

ENV TIME_ZONE=Asia/Shanghai
ENV TZ=Asia/Shanghai

WORKDIR /app
COPY . /app/
RUN yarn install && yarn build && apt update -y && apt install vim tmux -y

WORKDIR /app/packages/cli

CMD ["/bin/bash"]
