FROM ubuntu:groovy

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="JscDroidDev"

RUN apt-get update \
    && apt-get install apt-utils -y \
    && apt-get upgrade -y \
    && apt-get autoremove --purge -y \
    && apt-get install locales -y

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install onedrive -y
RUN mkdir -p /onedrive/config
RUN mkdir -p /onedrive/Data
RUN chmod -Rf 777 /onedrive

VOLUME /onedrive/Data


ENTRYPOINT ["onedrive" \
    ,"--confdir=/onedrive/config" \
    ,"--syncdir=/onedrive/Data" \
    ,"--disable-notifications"]
CMD ["--monitor"]
