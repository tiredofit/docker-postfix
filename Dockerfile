FROM docker.io/tiredofit/alpine:3.17
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

## Set Defaults
ENV CYRUS_SASL_VERSION=2.1.28 \
    POSTSRSD_VERSION=1.11 \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/postfix" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-postfix/"

## Dependencies Setup
RUN set -x && \
    addgroup -g 2525 postfix && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G postfix -u 2525 postfix && \
    apk update && \
    apk upgrade && \
    apk add -t .cyrus-sasl-build-deps \
                autoconf \
                automake \
                build-base \
                db-dev \
                gdbm-dev \
                git \
                gzip \
                groff \
                heimdal-dev \
                libtool \
                openldap-dev \
                openssl-dev \
                sqlite-dev \
                && \
    \
    apk add -t .postsrsd-build-deps \
                cmake \
                && \
    \
    apk add -t .postfix-run-deps \
                fail2ban \
                heimdal-libs \
                inotify-tools \
                libldap \
                logtail \
                openldap-clients \
                openssl \
                pflogsumm \
                postfix \
                postfix-pcre \
                postfix-ldap \
                rsyslog \
                tar \
                zstd \
                && \
    \
    ## Build
    git clone https://github.com/roehling/postsrsd /usr/src/postsrsd && \
    cd /usr/src/postsrsd && \
    git checkout ${POSTSRSD_VERSION} && \
    mkdir build && \
    cd build && \
    mkdir -p /etc/postsrsd && \
    cmake .. -DGENERATE_SRS_SECRET=OFF \
             -DCONFIG_DIR="/etc/postsrsd" \
             -DDOC_DIR="/usr/src/postsrsd/doc" \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DINIT_FLAVOR=none \
             && \
    make && \
    make install && \
    mv /etc/postsrsd/ /assets/postsrsd && \
    \
    ## Build Cyrus SASLD
    git clone -b cyrus-sasl-${CYRUS_SASL_VERSION} https://github.com/cyrusimap/cyrus-sasl/ /usr/src/cyrus-sasl && \
    cd /usr/src/cyrus-sasl && \
    autoreconf -fiv && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --mandir=/usr/src/cyrus-sasl/man \
        --disable-java \
        --disable-otp \
        --enable-alwaystrue \
        --enable-anon \
        --enable-auth-sasldb \
        --enable-cram \
        --enable-digest \
        --enable-gssapi \
        --enable-ldapdb \
        --enable-login \
        --enable-ntlm \
        --enable-plain \
        --enable-shared \
        --enable-static \
        --with-configdir=/etc/sasl2 \
        --with-dblib=gdbm \
        --with-dbpath=/etc/sasl2/sasldb2 \
        --with-devrandom=/dev/urandom \
        --with-gss_impl=heimdal \
        --with-ldap=/usr \
        --with-plugindir=/usr/lib/sasl2 \
        --with-rc4 \
        --with-saslauthd=/run/saslauthd \
        --without-pwcheck \
        && \
    \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install && \
    mkdir -p /etc/sasl2/sasldb2 && \
    ln -s /etc/postfix/aliases /etc/aliases && \
    \
    ## Cleanup
    cd /etc/fail2ban && \
    rm -rf fail2ban.conf fail2ban.d jail.conf jail.d paths-*.conf && \
    apk del .cyrus-sasl-build-deps .postsrsd-build-deps && \
    rm -rf /usr/src/* && \
    rm -rf /etc/logrotate.d/rsyslog && \
    rm -rf /var/cache/apk/*

## Networking Configuration
EXPOSE 25 587

## Entrypoint Configuration
COPY install /
