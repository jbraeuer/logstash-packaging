#!/bin/bash

VERSION=1.1.9

set -e

wget "http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar" \
    -O logstash-packaging/usr/share/logstash/logstash.jar
fpm1.9.1 \
    -n logstash \
    -v "$VERSION" \
    -d openjdk-7-jre \
    -a all \
    -m "<lesspublic@gmail.com>" \
    --pre-install logstash-packaging/logstash.preinstall \
    --description "Logstash Open Source Log Management" \
    --url 'http://www.logstash.net/' \
    --config-files etc/logstash/syslog.conf \
    --config-files etc/default/logstash \
    -t deb \
    -s dir etc usr var
