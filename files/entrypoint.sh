#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

ulimit -n 8192

if [ "$1" = "/usr/local/bin/service.sh" ]; then
	echo "configure ..."
	if [ ! -n "${HOSTNAME}" ]; then
		echo "set proxyName to ${HOSTNAME}"
		sed -i "s/confluence.benjamin-borbe.de/${HOSTNAME}/" /opt/confluence/conf/server.xml
	fi
	echo "configure done"
fi

echo "start $@"
exec "$@"
