FROM ubuntu:latest

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install jq && apt-get -y install python3 && apt-get -y install python3-pip

RUN apt-get -y install curl && apt-get -y install kafkacat && apt-get -y install bsdmainutils && apt-get -y install nano

COPY requirements.txt ./

RUN echo "**** installing MongoDB Python Driver ****" && \
    \
    pip3 install --no-cache-dir -r requirements.txt && \
     echo "**** installing MongoDB Shell ****" && \
    curl https://downloads.mongodb.com/compass/mongodb-mongosh_1.3.1_arm64.deb -o mongosh.deb && \
    dpkg --install mongosh.deb

WORKDIR /root
# COPY ../../tutorials/ ./
RUN echo 'PS1="\[\e[32m\][\e[mMongoDB Kafka Connector Tutorial\e[32m]\e[m : "' >> ~/.bashrc

COPY utilities/kc.sh /usr/local/bin/kc
COPY utilities/status.sh /usr/local/bin/status
COPY utilities/del.sh /usr/local/bin/del
COPY utilities/cx.sh /usr/local/bin/cx

RUN chmod u+x /usr/local/bin/kc
RUN chmod u+x /usr/local/bin/status
RUN chmod u+x /usr/local/bin/del
RUN chmod u+x /usr/local/bin/cx


RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/issue && cat /etc/motd' \
    >> /etc/bash.bashrc \
    ; echo "\
===================================================================\n\
= MongoDB Connector for Apache Kafka Tutorials                    =\n\
=                                                                 =\n\
= See MongoDB documentation for tutorial instructions.  This      =\n\
= container contains the following shortcut utilities             =\n\
=                                                                 =\n\
=  Command Line                   Description                     =\n\
=  kc (topicname)                 Shows contents of a topic       =\n\
=  del (connector)                Deletes Kafka Connect connector =\n\
=  cx (configuration file.json)   Configure Kafka Connect         =\n\
=  status                         Shows Kafka Connect status      =\n\
=  mongosh                        MongoDB Shell                   =\n\
===================================================================\n"\
    > /etc/motd> /etc/motd