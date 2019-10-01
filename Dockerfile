FROM ubuntu:bionic
LABEL maintainer "jc@phocean.net"

ENV PERL5LIB /regripper

RUN apt-get update \
  && apt-get install -y perl git libparse-win32registry-perl \
  && rm -rf /var/lib/apt/lists/* \
  && adduser --disabled-login --system --no-create-home regripper \
  && git clone https://github.com/keydet89/RegRipper2.8.git /regripper \
  && chown -R regripper /regripper \
  && rm -rf /regripper/.git

VOLUME /hive

USER regripper

WORKDIR /regripper

ENTRYPOINT ["perl", "rip.pl"]
