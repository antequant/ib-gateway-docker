FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y x11vnc xvfb unzip dos2unix wget socat

WORKDIR /root
RUN mkdir .vnc
RUN x11vnc -storepasswd 1358 .vnc/passwd

RUN wget -q --progress=bar:force:noscroll --show-progress https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh -O install-ibgateway.sh
RUN chmod a+x install-ibgateway.sh
RUN yes n | ./install-ibgateway.sh

RUN wget -q --progress=bar:force:noscroll --show-progress https://github.com/IbcAlpha/IBC/releases/download/3.8.1/IBCLinux-3.8.1.zip -O ibc.zip
RUN unzip ibc.zip -d /opt/ibc
RUN chmod a+x /opt/ibc/*.sh /opt/ibc/*/*.sh

COPY ibc_config.ini ibc/config.ini

ENV DISPLAY :0
ENV TRADING_MODE paper
EXPOSE 4002
EXPOSE 5900

COPY run.sh run.sh
RUN dos2unix run.sh

CMD ./run.sh