ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.18"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG CYRUS_SASL_VERSION
ARG POSTSRSD_VERSION

ENV CYRUS_SASL_VERSION=${CYRUS_SASL_VERSION:-"2.1.28"} \
    POSTSRSD_VERSION=${POSTSRSD_VERSION:-"1.12"} \
    CYRUS_SASL_REPO_URL=https://github.com/cyrusimap/cyrus-sasl \
    POSTSRSD_REPO_URL=https://github.com/roehling/postsrsd \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/postfix" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-postfix/"

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -g 2525 postfix && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G postfix -u 2525 postfix && \
    package update && \
    package upgrade && \
    package install .cyrus-sasl-build-deps \
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
    package install .postsrsd-build-deps \
                cmake \
                && \
    \
    package install .postfix-run-deps \
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
    clone_git_repo "${POSTSRSD_REPO_URL}" "${POSTSRSD_VERSION}" && \
    mkdir -p /etc/postsrsd && \
    mkdir -p build && \
    cd build && \
    cmake .. -DGENERATE_SRS_SECRET=OFF \
             -DCONFIG_DIR="/etc/postsrsd" \
             -DDOC_DIR="/usr/src/postsrsd/doc" \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DINIT_FLAVOR=none \
             && \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install && \
    mv /etc/postsrsd/ /assets/postsrsd && \
    \
    clone_git_repo "${CYRUS_SASL_REPO_URL}" cyrus-sasl-"${CYRUS_SASL_VERSION}" && \
    autoreconf -fiv && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --mandir=$(pwd)/man \
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
    package remove \
            .cyrus-sasl-build-deps \
            .postsrsd-build-deps \
            && \
    package cleanup && \
    rm -rf /etc/logrotate.d/* \
           /usr/src/*

EXPOSE 25 587

COPY install /
