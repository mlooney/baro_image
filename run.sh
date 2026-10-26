podman run -itd --rm -p 27015-27016:27015-27016/udp -v $(pwd)/conf/serversettings.xml:/srv/barotrauma/runtime/serversettings.xml baro:latest
