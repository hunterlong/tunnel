FROM alpine

WORKDIR $HOME/.tunnel
COPY tunnel /usr/local/bin/tunnel
COPY tunneld /usr/local/bin/tunneld
COPY server.key ./
COPY server.crt ./

RUN ls && pwd

ENTRYPOINT tunneld -tlsCrt server.crt -tlsKey server.key