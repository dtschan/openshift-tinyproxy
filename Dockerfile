FROM centos:7
RUN yum install -y epel-release && \
    yum install -y tinyproxy && \
    sed -i -e 's,LogFile "/var/log/tinyproxy/tinyproxy.log",LogFile "/dev/stdout",' -e 's,PidFile "/var/run/tinyproxy/tinyproxy.pid",PidFile "/tmp/tinyproxy.pid",' -e 's,Allow 127.0.0.1,Allow 10.0.0.0/8,' /etc/tinyproxy/tinyproxy.conf
EXPOSE 8888
CMD /usr/sbin/tinyproxy -d
