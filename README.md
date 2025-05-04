# Grafana & InfluxDB

Configuration for monitoring:
* [Shelly PlusPlug UK](https://www.shelly.com/products/shelly-plus-plug-uk)
* Proxmox

# Setup

## Configure each Shelly Plug

After setting each setting below, select **Save Settings**:

1. **Home > Switches > Settings > Input/Output settings**: Turn ON
2. **Home > Switches > Settings > Detach switch**: Detached
3. **Settings > Device name**: Set to plug[MAC]
4. **Settings > Location and time > Timezones**: Etc/UTC
5. **Settings > Location and time > SNTP server**: uk.pool.ntp.org
6. **Settings > Access Point settings > Enable AP network**: No
7. **Settings > Bluetooth settings > uncheck Enable Bluetooth**: No
8. **Settings > Authentication > Password protected device**: Yes
9. **Settings > Authentication > Password**: [choose password for web interface]
10. **Settings > MQTT settings > Enable**: Yes
11. **Settings > MQTT settings > Connection Type**: No TLS
12. **Settings > MQTT settings > MQTT Prefix**: plug/[MAC]
13. **Settings > MQTT settings > Enable MQTT Control:**: No
14. **Settings > MQTT settings > Enable RPC over MQTT**: No
15. **Settings > MQTT settings > RPC status notifications over MQTT**: Yes
16. **Settings > MQTT settings > Generic status update over MQTT**: Yes
17. **Settings > MQTT settings > Server**: [your-server.example.com:1883]
18. **Settings > MQTT settings > Client ID**: plug[MAC]
19. **Settings > MQTT settings > Username**: plugs
20. **Settings > MQTT settings > Password**: [choose password for mosquitto]
21. **Switches > Reset counters**
22. **Reboot**

## Create Discord channel webhook

1. Select **Edit channel**
2. Select **Integrations**
3. Select **Create Webhook**
4. Change Name to **Grafana**
5. For the avatar, select and upload the Grafana logo
6. Select **Copy Webhook URL**
7. Select **Save Changes**

## Set up project

1. `git clone git@github.com:zeropingheroes/grafana-influxdb.git`
2. `cd grafana-influxdb`
3. `cp .env.example .env`
4. `nano .env`
5. `docker compose up -d`
6. `docker exec -it -u 1883 mosquitto sh`
7. `mosquitto_passwd -c /mosquitto/config/passwd telegraf`
8. Enter password
9. `mosquitto_passwd /mosquitto/config/passwd plugs`
10. Enter password
11. `logout`
12. `nano .env` to add passwords
13. `docker compose restart mosquitto telegraf`

# References
* https://fullstackenergy.com/mqtt-into-influx/
* https://docs.influxdata.com/telegraf/v1/data_formats/input/json_v2/
* https://github.com/influxdata/telegraf/blob/master/plugins/inputs/mqtt_consumer/README.md
* https://github.com/influxdata/telegraf/blob/master/docs/CONFIGURATION.md
* https://www.influxdata.com/blog/telegraf-best-practices/
* https://docs.influxdata.com/telegraf/v1/configuration/
* https://github.com/tidwall/gjson
* https://shelly-api-docs.shelly.cloud/gen2/ComponentsAndServices/Switch/
* https://shelly-api-docs.shelly.cloud/gen2/ComponentsAndServices/Mqtt/
* https://kb.shelly.cloud/knowledge-base/shelly-plus-plug-uk
* https://mosquitto.org/documentation/
* https://mosquitto.org/man/mosquitto-conf-5.html
* https://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices/
* https://docs.influxdata.com/influxdb/v2/query-data/get-started/query-influxdb/
* https://docs.influxdata.com/influxdb/v2/reference/key-concepts/data-elements/
* https://docs.influxdata.com/influxdb/v2/write-data/best-practices/schema-design/
* https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/
* https://grafana.com/docs/grafana/latest/alerting/fundamentals/templates/
* https://grafana.com/docs/grafana/latest/alerting/configure-notifications/template-notifications/examples/
* https://grafana.com/docs/grafana/latest/alerting/alerting-rules/templates/language/



