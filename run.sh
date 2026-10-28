podman run -it -d --rm -p 27015-27016:27015-27016/udp \
	-v $(pwd)/conf/serversettings.xml:/srv/barotrauma/runtime/serversettings.xml:U \
	-v $(pwd)/conf/Data:/srv/barotrauma/runtime/Data \
	-v "$(pwd)/campaigns:/srv/barotrauma/runtime/Daedalic Entertainment GmbH/Barotrauma/Multiplayer":U \
	baro:latest
