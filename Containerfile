FROM docker.io/library/ubuntu:24.04

WORKDIR /app
USER root
EXPOSE 27015/udp 27016/udp

RUN apt update
RUN apt install -y software-properties-common locales
RUN apt-add-repository multiverse
RUN dpkg --add-architecture i386
RUN apt update
RUN bash -c 'echo steam steam/question select "I AGREE" | debconf-set-selections'
RUN bash -c 'echo steam steam/license note '' | debconf-set-selections'
RUN apt install -y  lib32gcc-s1 steamcmd
RUN apt upgrade -y
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
RUN /usr/games/steamcmd +login anonymous +app_info_update 1 +app_info_print 1026340 +quit > /dev/null
RUN /usr/games/steamcmd +force_install_dir /srv/barotrauma/runtime +login anonymous +app_update 1026340 validate +quit
RUN mkdir -p /root/.steam/sdk64
RUN ln -s /srv/barotrauma/runtime/linux64/steamclient.so /root/.steam/sdk64/steamclient.so
ENV XDG_DATA_HOME /srv/barotrauma/data   
ENTRYPOINT /srv/barotrauma/runtime/DedicatedServer

