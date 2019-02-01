FROM ubuntu:latest
MAINTAINER docker@stubdal.net
 
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y lighttpd perl git golang libjson-perl libdatetime-perl libwww-mechanize-perl cron
RUN mkdir /root/sslscan && mkdir /var/www/html/json && mkdir ~/git && cd ~/git && git clone https://github.com/ssllabs/ssllabs-scan && git clone https://github.com/nfcring/sslscan && ls sslscan
ADD index.html /var/www/html/.
ADD start.sh /root/.
RUN chmod 664 /var/www/html/* 
RUN cd ~/git/ssllabs-scan && go build ssllabs-scan-v3.go
RUN cp ~/git/sslscan/sslscan.css /var/www/html/. 
RUN chmod +x /root/start.sh 
RUN touch /var/log/cron.log
RUN apt-get install -y rsyslog
ADD sslscan_cron /etc/cron.d/.
ADD hosts.txt /root/git/sslscan/hosts.txt
RUN chmod 644 /etc/cron.d/sslscan_cron
ADD runscan.sh /root/.
RUN chmod +x /root/runscan.sh
CMD /root/start.sh



