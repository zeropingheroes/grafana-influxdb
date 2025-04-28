#!/bin/sh

set -e

#influx bucket create --skip-verify --name plugs --retention 0 --org $DOCKER_INFLUXDB_INIT_ORG
influx bucket create --skip-verify --name proxmox --retention 0 --org "${DOCKER_INFLUXDB_INIT_ORG}"
