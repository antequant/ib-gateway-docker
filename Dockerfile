FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y x11vnc xvfb

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1358 ~/.vnc/passwd

RUN wget -q https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh
RUN chmod a+x ibgateway-latest-standalone-linux-x64.sh
RUN yes n | ./ibgateway-latest-standalone-linux-x64.sh

RUN apt-get install -y unzip
RUN wget -q https://github.com/IbcAlpha/IBC/releases/download/3.8.1/IBCLinux-3.8.1.zip
RUN unzip IBCLinux-3.8.1.zip -d /opt/ibc
RUN chmod a+x /opt/ibc/*.sh /opt/ibc/*/*.sh

COPY ibc_config.ini /root/ibc/config.ini

CMD /opt/ibc/scripts/ibcstart.sh $(ls ~/Jts/ibgateway) --gateway --mode=paper

#CMD x11vnc -usepw -create -forever
EXPOSE 5900