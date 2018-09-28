FROM alpine
RUN apk add --no-cache curl

ENV VERSION 2.1

RUN curl -L https://github.com/mmatczuk/go-http-tunnel/releases/download/$VERSION/tunnel_linux_amd64.tar.gz | tar xvz && \
	mv tunneld /usr/local/bin/tunneld

WORKDIR $HOME/.tunnel

COPY server.key ./
COPY server.crt ./

RUN ls && pwd

EXPOSE 80
EXPOSE 443
EXPOSE 5223

ENTRYPOINT tunneld -tlsCrt server.crt -tlsKey server.key
