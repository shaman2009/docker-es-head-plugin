FROM node:7.2.1

RUN mkdir -p /var/head &&\
    PHANTOMJS_CDNURL=https://npm.taobao.org/dist/phantomjs npm install -g phantomjs --registry=https://registry.npm.taobao.org --no-proxy

WORKDIR /var/head

RUN git clone git://github.com/mobz/elasticsearch-head.git  &&\
    npm config set registry https://registry.npm.taobao.org &&\
    cd elasticsearch-head &&\
    npm install &&\
    npm install -g grunt

EXPOSE 9100

WORKDIR /var/head/elasticsearch-head

ENTRYPOINT ["grunt", "server"]
