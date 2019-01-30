#!/bin/sh
# start syslog
rsyslogd
# start web server
/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
# run cron - which runs scan from /etc/cron.d/sslscan_cron
cron && tail -f /var/log/syslog
