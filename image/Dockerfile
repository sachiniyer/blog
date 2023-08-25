FROM alpine:latest

WORKDIR /

COPY run-hugo /run-hugo
RUN chmod +x /run-hugo

RUN apk update \
 && apk add wget

EXPOSE 80/tcp

ENTRYPOINT ["/run-hugo"]
