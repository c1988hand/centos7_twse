#write dockerfile:

#安裝os版本
FROM centos:7

#創建者名稱
MAINTAINER "carry_wu" <carry_wu@syscom.com.tw>

#安裝centos7
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# 安裝 JDK 5 (二-localhost)
#yum install glibc.i686 ,32位元的 libraries
#yum -y upgrade
RUN yum -y install glibc
RUN mkdir /sys_test
ADD ./jdk-1_5_0_22-linux-amd64.rpm /sys_test/
#RUN cd /sys_test &&  curl -O 'https://drive.google.com/file/d/0B-9REGDR2k8UWGloMUhWOWo1NHM/view?usp=sharing/jdk-1_5_0_22-linux-amd64.rpm'
#對jdk安裝程序增加執行權限
RUN chmod +x /sys_test/jdk-1_5_0_22-linux-amd64.rpm
RUN rpm -ivh /sys_test/jdk-1_5_0_22-linux-amd64.rpm
#RUN yum -y install /sys_test/jdk-1_5_0_22-linux-amd64.rpm

#ENV JAVA_HOME 

EXPOSE 8080

CMD ["/bin/bash"]
