FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y x11vnc xvfb unzip dos2unix

WORKDIR /root
RUN mkdir .vnc
RUN x11vnc -storepasswd 1358 .vnc/passwd

ADD https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh install-ibgateway.sh
RUN chmod a+x install-ibgateway.sh
RUN yes n | ./install-ibgateway.sh

ADD https://github.com/IbcAlpha/IBC/releases/download/3.8.1/IBCLinux-3.8.1.zip ibc.zip
RUN unzip ibc.zip -d /opt/ibc
RUN chmod a+x /opt/ibc/*.sh /opt/ibc/*/*.sh

COPY ibc_config.ini ibc/config.ini

COPY run.sh run.sh
RUN dos2unix run.sh

CMD ./run.sh
EXPOSE 5900