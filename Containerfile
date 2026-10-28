FROM docker.io/library/ubuntu:24.04

WORKDIR /app
USER root
EXPOSE 27015/udp 27016/udp

RUN apt-get update
RUN apt-get install -y software-properties-common locales
RUN apt-add-repository multiverse
RUN dpkg --add-architecture i386
RUN apt-get update
RUN bash -c 'echo steam steam/question select "I AGREE" | debconf-set-selections'
RUN bash -c 'echo steam steam/license note '' | debconf-set-selections'
RUN apt-get install -y  lib32gcc-s1 steamcmd
RUN apt-get upgrade -y
RUN apt-get clean
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
RUN adduser  --disabled-password --gecos "" baro
RUN mkdir -p /srv/barotrauma/runtime "/srv/barotrauma/runtime/Daedalic Entertainment GmbH/Barotrauma" && chown -R baro:baro /srv
USER baro
RUN /usr/games/steamcmd +login anonymous +app_info_update 1 +app_info_print 1026340 +quit > /dev/null
RUN /usr/games/steamcmd +force_install_dir /srv/barotrauma/runtime +login anonymous +app_update 1026340 validate +quit
RUN mkdir -p /home/baro/.steam/sdk64
RUN ln -s /srv/barotrauma/runtime/linux64/steamclient.so /home/baro/.steam/sdk64/steamclient.so
ENV XDG_DATA_HOME /srv/barotrauma/data   
RUN chown  baro:baro "/srv/barotrauma/runtime/Daedalic Entertainment GmbH/Barotrauma"
COPY scripts/wrap.sh /srv/wrap.sh
ENTRYPOINT ["/srv/wrap.sh"]

