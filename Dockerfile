# CentOS 6 based container with ssh & supervisord installed
#

FROM centos:centos6
MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

RUN /usr/bin/yum -y update && \
/usr/bin/yum -y install openssh-server openssh-clients python-setuptools wget unzip git && \
/usr/bin/easy_install supervisor

ADD authorized_keys /root/.ssh/authorized_keys
ADD supervisord.id_rsa.pub /root/.ssh/supervisord.id_rsa.pub
ADD supervisord.conf /etc/supervisord.conf
ADD supervisord-startup.sh /bin/supervisord-startup.sh

CMD /bin/supervisord-startup.sh

EXPOSE 22