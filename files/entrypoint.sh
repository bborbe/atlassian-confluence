#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

ulimit -n 8192

if [ "$1" = "/usr/local/bin/service.sh" ]; then
	echo "configure ..."

	HOSTNAME=${HOSTNAME:-"confluence.benjamin-borbe.de"}
	echo "set hostname to ${HOSTNAME}"
	sed -i "s/{{HOSTNAME}}/${HOSTNAME}/" /opt/confluence/conf/server.xml

	PORT=${PORT:-"443"}
	echo "set port to ${PORT}"
	sed -i "s/{{PORT}}/${PORT}/" /opt/confluence/conf/server.xml

	PORT=${SCHEMA:-"https"}
	echo "set schema to ${SCHEMA}"
	sed -i "s/{{SCHEMA}}/${SCHEMA}/" /opt/confluence/conf/server.xml

	echo "configure done"
fi

echo "start $@"
exec "$@"
