#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

ulimit -n 8192

if [ "$1" = "/usr/local/bin/service.sh" ]; then
	echo "configure ..."

	PORT=${PORT:-"8080"}
	echo "set port to ${PORT}"
	sed -i "s/{{PORT}}/${PORT}/" /opt/confluence/conf/server.xml

	ADDRESS=${ADDRESS:-"0.0.0.0"}
	echo "set address to ${ADDRESS}"
	sed -i "s/{{ADDRESS}}/${ADDRESS}/" /opt/confluence/conf/server.xml

	PROXY_NAME=${HOSTNAME:-"confluence.benjamin-borbe.de"}
	echo "set proxyName to ${PROXY_NAME}"
	sed -i "s/{{PROXY_NAME}}/${PROXY_NAME}/" /opt/confluence/conf/server.xml

	PROXY_PORT=${PROXY_PORT:-"443"}
	echo "set proxyPort to ${PROXY_PORT}"
	sed -i "s/{{PROXY_PORT}}/${PROXY_PORT}/" /opt/confluence/conf/server.xml

	PORT=${SCHEMA:-"https"}
	echo "set schema to ${SCHEMA}"
	sed -i "s/{{SCHEMA}}/${SCHEMA}/" /opt/confluence/conf/server.xml

	echo "configure done"
fi

echo "start $@"
exec "$@"
