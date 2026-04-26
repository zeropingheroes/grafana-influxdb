#!/bin/bash

source .env

docker exec -it mosquitto mosquitto_sub -h localhost -p 1883 -u ${TELEGRAF_MQTT_USERNAME} -P ${TELEGRAF_MQTT_PASSWORD} -v -t '#'
