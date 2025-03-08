# Dockerfile
FROM alpine:latest as builder

RUN apk update && apk add git

WORKDIR /root
RUN git clone -b gh-pages https://github.com/ethereum/remix-live.git remix && cd remix && rm -rf .git


FROM nginx:alpine

WORKDIR /

COPY --from=builder /root/remix /usr/share/nginx/html/

EXPOSE 80
