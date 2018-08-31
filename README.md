# docker-swiv
Docker repo for Yahoo Swiv that used to be Imply Pivot before they closed sourced it.

Here are 3 typical usages --

1) Supply your druid broker host and broker port

```
docker run -d -e "DRUID_BROKER_HOST=192.168.1.156" -e "DRUID_BROKER_PORT=8082" -p 9090:9090 uchhatre/druid-pivot-swiv:latest
```


2) If you supply only druid host, the container will attemp port 8082 for druid broker

```
docker run -d -e "DRUID_BROKER_HOST=192.168.1.156"  -p 9090:9090 uchhatre/druid-pivot-swiv:latest
```

3) If you know how to run Swiv, details here, you can just supply those arguments

```
docker run -d -e "MYARGS=--druid 192.168.1.156:8082" -p 9090:9090 uchhatre/druid-pivot-swiv:latest
```

4) If you have a config file that you want to run, load it as below

```
docker run -d -v "/full-path-to-file/config.yml:/etc/config/swiv/config.yml" -p 9090:9090 uchhatre/druid-pivot-swiv:latest
```

5) Default no argument run will try to connect to druid at druid_broker_host:8082

```
docker run -d -p 9093:9090 uchhatre/druid-pivot-swiv:latest
```

