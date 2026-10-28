# Barotrauma dedicated OCI container image

A simple and relatively safe-ish way to run your Barotrauma server on Linux


## Usage

./run.sh [args]

### Configuration

To change your settings, edit conf/serversettings.xml to suit your
requirements (or figure out a way to pass empty strings through podman
into the wrapper script without interpolating weirdly, and let me know)
