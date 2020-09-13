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


