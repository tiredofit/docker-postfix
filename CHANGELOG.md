## 0.14.5 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.16 base


## 0.14.4 2022-02-15 <dave at tiredofit dot ca>

   ### Changed
      - Fix for sudo command not working with Alpine base


## 0.14.3 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Rework to support new base image


## 0.14.2 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Refresh base image


## 0.14.1 2022-01-28 <dave at tiredofit dot ca>

   ### Added
      - Add ENABLE_THREADED_BOUNCES (default TRUE)


## 0.14.0 2022-01-25 <dave at tiredofit dot ca>

   ### Changed
      - Change Default Settings for Queue Delivery and add Delay Warning time


## 0.13.17 2021-12-27 <dave at tiredofit dot ca>

   ### Changed
      - Small tweak to Zabbix monitoring script


## 0.13.16 2021-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Switch to using a new Zabbix monitoring template


## 0.13.15 2021-12-10 <dave at tiredofit dot ca>

   ### Changed
      - Rework of 0.13.14


## 0.13.14 2021-12-10 <dave at tiredofit dot ca>

   ### Added
      - Add logtail package

   ### Changed
      - Update Zabbix monitoring templates


## 0.13.13 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Auto register support for templates


## 0.13.12 2021-11-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.15 base


## 0.13.11 2021-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Fix for 13.10


## 0.13.10 2021-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Fail2ban Logging change


## 0.13.9 2021-10-01 <dave at tiredofit dot ca>

   ### Changed
      - Make postfix own /logs/ folder


## 0.13.8 2021-09-21 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix of 0.13.7


## 0.13.7 2021-09-21 <dave at tiredofit dot ca>

   ### Changed
      - Repair rsyslog


## 0.13.6 2021-09-04 <dave at tiredofit dot ca>

   ### Changed
      - Change the way logrotation is configured


## 0.13.5 2021-09-01 <dave at tiredofit dot ca>

   ### Changed
      - Change the way aliases are linked
      - Modernize environment variables and cleanup a hacky Zabbix monitoring feature


## 0.13.4 2021-07-28 <dave at tiredofit dot ca>

   ### Changed
      - Change Postscreen settings to add more DNS checks and cache tweaks


## 0.13.3 2021-07-13 <dave at tiredofit dot ca>

   ### Added
      - Disable Transport Map being on by default


## 0.13.2 2021-07-13 <dave at tiredofit dot ca>

   ### Added
      - Always assume lmdb for additional mapping files


## 0.13.1 2021-07-13 <dave at tiredofit dot ca>

   ### Added
      - Add support for additional Virtual mailbox maps


## 0.13.0 2021-07-12 <dave at tiredofit dot ca>

   ### Added
      - Add postfix user and group before installation


## 0.12.3 2021-07-12 <dave at tiredofit dot ca>

   ### Changed
      - Fix Build issues with Cyrus-SASL


## 0.12.2 2021-07-08 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 base

   ### Changed
      - Disable sender rewrite daemon default


## 0.12.0 2021-03-27 <dave at tiredofit dot ca>

   ### Added
      - PostSRSD 1.11
      - Force changing permissions reset on postfix/data directory before startup

   ### Changed
      - Change Cyrus SASL to use gdbm instead of bdb
      - Fix for Cyrus SASLD not authenticating
      - Remove postfix-lmdb package as it is set by default
      - Fix for Bounce Messages not being rewritten


## 0.11.0 2021-01-14 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.13 Base         


## 0.10.4 2020-10-02 <dave at tiredofit dot ca>

   ### Added
      - Add custom bounce message support by placing templates in data location

   ### Changed
      - Fix PostSRSd being disabled limiting postfix from starting


## 0.10.3 2020-09-29 <dave at tiredofit dot ca>

   ### Added
      - Add Plus Addressing rewrite feature


## 0.10.2 2020-09-17 <dave at tiredofit dot ca>

   ### Added
      - Further work on switching over to LMDB


## 0.10.1 2020-09-17 <dave at tiredofit dot ca>

   ### Added
      - Switch to LMDB for databases instead of bdb due to AGPL shift


## 0.10.0 2020-09-13 <dave at tiredofit dot ca>

   ### Added
      - Add PostSRSd support / Sender Rewriting

   ### Changed
      - Cleanup populating postfix configuration when LDAP disabled
      - Code Cleanup


## 0.9.5 2020-09-05 <dave at tiredofit dot ca>

   ### Added
      - Add SMTPD sender and HELO restrictions

   ### Changed
      - Change fail2ban backend to AUTO


## 0.9.4 2020-09-04 <dave at tiredofit dot ca>

   ### Added
      - Add TRANSPORT_MAP functionality to route to external SMTP services


## 0.9.3 2020-08-30 <dave at tiredofit dot ca>

   ### Added
      - Add Relay Mechanism Filter environment variable


## 0.9.2 2020-08-29 <dave at tiredofit dot ca>

   ### Added
      - Added inotify support to reload Postfix when certificates change (Letsencrypt renew process)


## 0.9.1 2020-06-27 <dave at tiredofit dot ca>

   ### Changed
      - Working Group Expansion


## 0.9.0 2020-06-27 <dave at tiredofit dot ca>

   ### Added
      - Add LDAP Group and Group Exploding Support


## 0.8.1 2020-06-22 <dave at tiredofit dot ca>

   ### Changed
      - Temporarily disable some SASL features


## 0.8.0 2020-06-22 <dave at tiredofit dot ca>

   ### Changed
      - Updates to SASL to fix SMTP sending
      - Removed chroot on one process


## 0.7.0 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix startup issues


## 0.6.0 2020-06-21 <dave at tiredofit dot ca>

   ### Added
      - Add enable/disable LMTP
      - Add enable/disable RSPAMD features


## 0.0.5 2020-06-15 <dave at tiredofit dot ca>

   ### Added
      - Modernize image to support tiredofit/alpine 5.xx base series


## 0.0.4 2020-06-05 <dave at tiredofit dot ca>

   ### Changed
      - Move /etc/s6/services to /etc/available


## 0.0.3 2020-05-20 <dave at tiredofit dot ca>

   ### Added
      - Add check for RSPAMD Host


## 0.0.2 2020-05-20 <dave at tiredofit dot ca>

   ### Added
      - Create Persistent Storage


## 0.0.1 2020-05-20 <dave at tiredofit dot ca>

   ### Added
      - Initial Release


