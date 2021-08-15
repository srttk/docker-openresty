FROM openresty/openresty:1.19.3.2-3-focal

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# RUN apt-get install -y build-essential
RUN apt-get update


RUN apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache  php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm

RUN apt-get install -y php7.1-dev
RUN apt-get install -y php7.1-xml
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libuv1.dev

#  Cassandra cpp driver dependency
RUN apt-get install -y libssl-dev libkrb5-dev zlib1g
RUN apt-get install -y wget

RUN wget https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.14.0/cassandra-cpp-driver_2.14.0-1_amd64.deb
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1.2_amd64.deb
RUN dpkg -i ./multiarch-support_2.27-3ubuntu1.2_amd64.deb
RUN dpkg -i ./cassandra-cpp-driver_2.14.0-1_amd64.deb
RUN apt install -y git-all

# Git clone php-deriver
RUN git clone https://github.com/datastax/php-driver.git

RUN ls
RUN cd php-driver && ls && git submodule update --init 

RUN apt-get install -y cmake

RUN ls

RUN wget https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.14.0/cassandra-cpp-driver-dbg_2.14.0-1_amd64.deb
RUN wget https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.14.0/cassandra-cpp-driver-dev_2.14.0-1_amd64.deb
RUN wget https://downloads.datastax.com/cpp-driver/ubuntu/18.04/cassandra/v2.14.0/cassandra-cpp-driver_2.14.0-1_amd64.deb

RUN dpkg -i ./cassandra-cpp-driver-dbg_2.14.0-1_amd64.deb
RUN dpkg -i ./cassandra-cpp-driver-dev_2.14.0-1_amd64.deb
RUN dpkg -i ./cassandra-cpp-driver_2.14.0-1_amd64.deb

RUN pecl install cassandra

RUN php -i 
RUN cat /etc/php/7.1/fpm/php.ini

COPY start_php-fpm start_php-fpm
COPY start_openresty start_openresty
COPY boot.sh boot.sh
RUN chmod +x ./boot.sh
RUN chmod +x ./start_php-fpm
RUN chmod +x ./start_openresty
CMD ["bash", "./boot.sh"]