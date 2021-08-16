FROM ubuntu:18.04

# Intstall ubuntu essentials
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y  cmake wget libssl-dev libkrb5-dev unzip
RUN apt-get install -y zlib1g git-all

# Install php / php-fpm

RUN apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache  php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-dev php7.1-xml libgmp-dev libuv1.dev php7.1-fpm




# Intsll openresty
RUN mkdir installers
RUN cd installers && wget https://openresty.org/download/openresty-1.13.6.2.tar.gz
RUN cd installers && tar -xvf openresty-1.13.6.2.tar.gz

# INFO: In ubuntu 18.04 >=  the zlib package is zlib1g
RUN apt install -y zlib1g zlib1g-dev
RUN cd installers/openresty-1.13.6.2 && ./configure -j2
RUN cd installers/openresty-1.13.6.2 && make install


# Start services
WORKDIR /land

COPY ./scripts/start_phpfpm start_phpfpm
COPY ./scripts/start_openresty start_openresty
COPY ./scripts/init.sh init.sh

RUN chmod +x ./init.sh
RUN chmod +x ./start_phpfpm
RUN chmod +x ./start_openresty
CMD ["./init.sh"]

