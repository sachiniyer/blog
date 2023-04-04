FROM debian

ENV HUGO_VERSION=0.111.3
ENV BASE_URL=https://blog.sachiniyer.com
ENV ENVIRONMENT=live

RUN apt update;
RUN apt install wget -y;
RUN cd /;
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz;
RUN tar zxvf hugo_${HUGO_VERSION}_linux-amd64.tar.gz;

RUN echo "#!/bin/sh \n/hugo server -s /data/hugo --appendPort=false -e $ENVIRONMENT --bind 0.0.0.0 --baseURL $BASE_URL --buildDrafts" > /run-hugo
RUN chmod +x /run-hugo

ENTRYPOINT ["/run-hugo"]
