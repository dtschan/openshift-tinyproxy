FROM centos:7
RUN yum install -y epel-release && \
    yum install -y tinyproxy && \
    sed -i -e 's,LogFile "/var/log/tinyproxy/tinyproxy.log",LogFile "/dev/stdout",' -e 's,PidFile "/var/run/tinyproxy/tinyproxy.pid",PidFile "/tmp/tinyproxy.pid",' /etc/tinyproxy/tinyproxy.conf
CMD /usr/sbin/tinyproxy -d
