FROM node:18-alpine as build-stage
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm i && npm i -g @quasar/cli
ARG mode
COPY build-stage.sh ./
RUN chmod u+x build-stage.sh && sh build-stage.sh spa

FROM nginx:alpine as prod-stage
WORKDIR /usr/share/nginx/html
