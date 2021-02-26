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

	PROXY_NAME=${PROXY_NAME:-"confluence.benjamin-borbe.de"}
	echo "set proxyName to ${PROXY_NAME}"
	sed -i "s/{{PROXY_NAME}}/${PROXY_NAME}/" /opt/confluence/conf/server.xml

	PROXY_PORT=${PROXY_PORT:-"443"}
	echo "set proxyPort to ${PROXY_PORT}"
	sed -i "s/{{PROXY_PORT}}/${PROXY_PORT}/" /opt/confluence/conf/server.xml

	SCHEMA=${SCHEMA:-"https"}
	echo "set schema to ${SCHEMA}"
	sed -i "s/{{SCHEMA}}/${SCHEMA}/" /opt/confluence/conf/server.xml

	MEMORY=${MEMORY:-"1024"}
	echo "set memory to ${MEMORY}"
	sed -i "s/-Xms1024m/-Xms${MEMORY}m/" /opt/confluence/bin/setenv.sh
	sed -i "s/-Xmx1024m/-Xmx${MEMORY}m/" /opt/confluence/bin/setenv.sh

	echo "configure done"
fi

echo "start $@"
exec "$@"
