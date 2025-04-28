# Grafana & InfluxDB

## Setup

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

