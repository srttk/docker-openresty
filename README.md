# Docker Openresty 👹

A Dockrized openresty + php-fpm setup 👻

All configuration files are located in `/volume/` directory

| Component         | version | Inside Container                 | Local                          |
| ----------------- | ------- | -------------------------------- | ------------------------------ |
| Openresty / nginx | 1.13    | /usr/local/openresty/nginx/conf/ | /volume//openresty/nginx/conf/ |
| PHP               | 7.1     | /etc/php/7.1/cli                 | /volume/php/cli/               |
| php-fpm           | 7.1     | /etc/php/7.1/fpm                 | /volume/php/fpm/               |

## Public www directory

`/volume/www`

## Installation

- Step 1 : Build dockerimage `toothless:1` by running ./build-dockerfile.sh
- Step 2 : `run docker-compose up` 🔥
- Step 3 : Check localhost in browser

## Log files

Log files are located in
`/volume/outbox` Directory

### Info

#### Openresty

path : /usr/local/openresty/
Executable file : /usr/local/openresty/bin/openresty

nginx: /usr/local/openresty/nginx
/usr/local/openresty/nginx/conf/nginx.conf

serve folde : /usr/local/openresty/nginx/html

#### PHP 7.1

CLI Configuration : /etc/php/7.1/cli

#### PHP Fpm

Configuration path: /etc/php/7.1/fpm
