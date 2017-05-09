FROM alpine:3.5
MAINTAINER Alex McLain <alex@alexmclain.com>

# Don't install Ruby docs.
RUN echo "gem: --no-rdoc --no-ri --env-shebang" >> "$HOME/.gemrc"

RUN apk add --no-cache --update ruby ruby-dev ruby-rake openssl openssl-dev curl libffi-dev make gcc musl-dev g++
RUN gem install dep

ADD . /srv/app
WORKDIR /srv/app

RUN dep install

EXPOSE 8080
CMD ["puma"]
