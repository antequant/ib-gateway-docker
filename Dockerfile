FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y x11vnc xvfb

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1358 ~/.vnc/passwd

RUN wget -q https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh
RUN chmod a+x ibgateway-latest-standalone-linux-x64.sh
RUN yes n | ./ibgateway-latest-standalone-linux-x64.sh

CMD x11vnc -usepw -create