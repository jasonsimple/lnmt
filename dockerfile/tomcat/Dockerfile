FROM docker.io/centos:centos6
MAINTAINER The fifth group
# Install packages needed
RUN yum -y install gcc gcc-c++  python-setuptools openssh-server
RUN easy_install supervisor

# Setting ssh connect
RUN echo "root:123123" | chpasswd
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN mkdir -pv /var/run/sshd
RUN mkdir -pv /root/.ssh
RUN sed -i 's/session required pam_loginuid.so/#session required pam_loginuid.so/g' /etc/pam.d/sshd
ADD authorized_keys /root/.ssh/authorized_keys

# Install JDK 
ADD jdk-7u65-linux-x64.gz /usr/src/
WORKDIR /usr/src/
RUN mv jdk1.7.0_65 /usr/local/java 
ENV JAVA_HOME /usr/local/java 
ENV PATH $JAVA_HOME/bin:$PATH 

# Install tomcat 
ADD apache-tomcat-7.0.54.tar.gz /usr/src/
WORKDIR /usr/src/
RUN mv apache-tomcat-7.0.54 /usr/local/tomcat7 
ENV JAVA_HOME /usr/local/java 
ENV CATALINA_HOME /usr/local/tomcat7
ENV PATH $JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH 

# Tomcat connect to MySQL
ADD mysql-connector-java-5.1.40.tar.gz /usr/src/
WORKDIR /usr/src/mysql-connector-java-5.1.40
RUN /bin/cp mysql-connector-java-5.1.40-bin.jar /usr/local/tomcat7/lib/mysql-connector-java-5.1.40-bin.jar

# Use supervisord to start tomcat 
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 8080 22
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
