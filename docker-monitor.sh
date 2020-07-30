# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

#      ██╗███████╗███╗   ██╗██╗  ██╗██╗███╗   ██╗███████╗
#      ██║██╔════╝████╗  ██║██║ ██╔╝██║████╗  ██║██╔════╝
#      ██║█████╗  ██╔██╗ ██║█████╔╝ ██║██╔██╗ ██║███████╗
# ██   ██║██╔══╝  ██║╚██╗██║██╔═██╗ ██║██║╚██╗██║╚════██║
# ╚█████╔╝███████╗██║ ╚████║██║  ██╗██║██║ ╚████║███████║
#  ╚════╝ ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝
# jenkins
docker run \
    --privileged \
    --name jenkins \
    -d --restart always \
    -p 8080:8080 -p 50000:50000 \
    -v /data/jenkins:/var/jenkins_home \
    jenkins/jenkins:lts

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
#    ____ _____     /￣/___ _____  ____ _
#   / __ `/ __ \   / / __ `/ __ \/ __ `/
#  / /_/ / /_/ /  / / /_/ / / / / /_/ /
#  \__, /\____/  /_/\__,_/_/ /_/\__, /
# /____/                       /____/
# go lang
# go安裝 https://linuxize.com/post/how-to-install-go-on-centos-7/
# go安裝套件 https://github.com/octplane/wikiquote-parser/issues/1
# glide安裝 https://github.com/Masterminds/glide
curl https://glide.sh/get | sh  # 需要設定$GOPATH


# ███████╗ █████╗ ██████╗ ██████╗ ██╗██╗  ██╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔══██╗██║╚██╗██╔╝
#   ███╔╝ ███████║██████╔╝██████╔╝██║ ╚███╔╝
#  ███╔╝  ██╔══██║██╔══██╗██╔══██╗██║ ██╔██╗
# ███████╗██║  ██║██████╔╝██████╔╝██║██╔╝ ██╗
# ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝

# zabbix
git clone https://github.com/zabbix/zabbix-docker.git
cd zabbix-docker/
git checkout 4.0

#  ██████╗ ██████╗  █████╗ ███████╗ █████╗ ███╗   ██╗ █████╗
# ██╔════╝ ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗
# ██║  ███╗██████╔╝███████║█████╗  ███████║██╔██╗ ██║███████║
# ██║   ██║██╔══██╗██╔══██║██╔══╝  ██╔══██║██║╚██╗██║██╔══██║
# ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║██║ ╚████║██║  ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
# grafana
# grafana.ini https://community.grafana.com/t/smtp-not-configured-check-your-grafana-ini-config-files-smtp-section/1113/5
mkdir -p /data/grafana/etc
mkdir -p /data/grafana/lib
docker run -d -p 3000:3000 --name=grafana \
-v /data/grafana/lib:/var/lib/grafana  \
-v /data/grafana/etc:/etc/grafana  \
grafana/grafana

#     ____  _________  ____ ___  ___  /￣/_/￣/_ ___  __  _______
#    / __ \/ ___/ __ \/ __ `__ \/ _ \/ __/ __ \/ _ \/ / / / ___/
#   / /_/ / /  / /_/ / / / / / /  __/ /_/ / / /  __/ /_/ (__  )
#  / .___/_/   \____/_/ /_/ /_/\___/\__/_/ /_/\___/\__,_/____/
# /_/
# prometheus
docker run -d -p 9090:9090 --name prom --privileged -v \
/data/prom/prometheus.yml:/usr/local/src/file/prometheus.yml \
quay.io/prometheus/prometheus --config.file=/usr/local/src/file/prometheus.yml

# prometheus 2
docker run --log-driver json-file --log-opt max-size=500m --log-opt max-file=3 -d \
-p 9090:9090 -v /usr/local/src/prometheus.yml:/usr/local/src/prometheus.yml \
quay.io/prometheus/prometheus --config.file=/usr/local/src/prometheus.yml

#    ____  ____  ___/￣/__        ___  _  __ ___  ____  _____/￣/___  _____
#   / __ \/ __ \/ __  / _ \______/ _ \| |/_/ __ \/ __ \/ ___/ __/ _ \/ ___/
#  / / / / /_/ / /_/ /  __/_____/  __/>  </ /_/ / /_/ / /  / /_/  __/ /
# /_/ /_/\____/\__,_/\___/      \___/_/|_/ .___/\____/_/   \__/\___/_/
#                                       /_/
# node-exporter
docker run -d --name node_exp -p 9100:9100 quay.io/prometheus/node-exporter


# 參數意義 https://www.jianshu.com/p/413fd42ae660
# https://www.qingtingip.com/h_341198.html
# https://www.shuimuyun.com/17627.html
# https://prometheus.io/docs/prometheus/latest/querying/examples/
# CPU: 
# 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
# 100 - (avg by (instance) (irate(process_cpu_seconds_total{mode="idle"}[5m])) * 100)

#    ________  ___/￣(_)____
#   / ___/ _ \/ __  / / ___/
#  / /  /  __/ /_/ / (__  )
# /_/   \___/\__,_/_/____/

# redis


# redis_exporter
docker run --name redisdb -d -p 7001:6379 redis 
IPADDR=$(ip -br address show dev $DEVICE | awk '{print substr($3,1,index($3,"/")-1);}')
docker run -d --name redis_exporter -p 9122:9122 oliver006/redis_exporter --redis.addr \
redis://$IPADDR:6379


#    _____ ___ _/￣/_ /￣/_ (_)￣/_   /￣|/￣/__￣\
#   / ___/ __ `/ __ \/ __ \/ / __/  / /|_/ / / / /
#  / /  / /_/ / /_/ / /_/ / / /_   / /  / / /_/ /
# /_/   \__,_/_.___/_.___/_/\__/  /_/  /_/\___\_\

label_values(rabbitmq_up, node)

# rabbit MQ https://www.rabbitmq.com/getstarted.html
docker  run -d --hostname localhost --name rabbit \
-e RABBITMQ_DEFAULT_USER=admin \
-e RABBITMQ_DEFAULT_PASS=admin \
-p 15672:15672 -p 5672:5672 \
rabbitmq:3.6.15-management

# rabbitMQ_exporter

export RABBIT_USER=admin 
export RABBIT_PASSWORD=admin 
export OUTPUT_FORMAT=JSON 
export PUBLISH_PORT=9099 
export RABBIT_URL=http://192.168.0.68:15672 nohup 
./rabbitmq_exporter &

#    ____ ___  ____  ____  ____ _____  ___/￣/￣/
#   / __ `__ \/ __ \/ __ \/ __ `/ __ \/ __  / __ \
#  / / / / / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /
# /_/ /_/ /_/\____/_/ /_/\__, /\____/\__,_/_.___/
#                       /____/ 
# mongodb 
# https://ithelp.ithome.com.tw/articles/10201657
# mkdir mongo4; chmod -R 777 mongo4;
docker run -d --name mongo -v $PWD/mongo:/data -p 27017:27017 mongo:3.6
docker run -d --name mongo -v $PWD/mongo:/data -p 27017:27017 --net=bridge mongo:3
docker run -d --name mongo -v /data/mongo3:/data -p 27017:27017 --net=bridge mongo:3

# mongodb_exporter
# mongodb_exporter
# https://devconnected.com/mongodb-monitoring-with-grafana-prometheus/
# https://grafana.com/grafana/dashboards/2583
# http://confluence.1yuans.com/pages/viewpage.action?pageId=22937659
# wget 
db.createUser({ user:'root',pwd:'root123456',roles:[ { role:'userAdminAnyDatabase', db:'admin'}]});
db.createUser({ user:'user',pwd:'pwd',roles:[ { role:'userAdminAnyDatabase', db:'admin'}]});
# export MONGODB_URI=mongodb://mongodb_exporter:passord@localhost:27017  172.17.0.7f
# export MONGODB_URI=mongodb://172.17.0.7:27017
export MONGODB_URI=mongodb://192.168.0.68:27017
./mongodb_exporter &

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'
docker exec -it  ifconfig

# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# https://www.cnblogs.com/weschen/p/11046906.html elk + filebeat

# ███████╗██╗      █████╗ ███████╗████████╗██╗ ██████╗███████╗
# ██╔════╝██║     ██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔════╝
# █████╗  ██║     ███████║███████╗   ██║   ██║██║     ███████╗
# ██╔══╝  ██║     ██╔══██║╚════██║   ██║   ██║██║     ╚════██║
# ███████╗███████╗██║  ██║███████║   ██║   ██║╚██████╗███████║
# ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝╚══════╝
# elastics
# es ERROR: [1] bootstrap checks failed
# https://cloud.tencent.com/developer/article/1549867
vim /etc/security/limits.conf 
* soft nofile 65536
* hard nofile 65536
sysctl -w vm.max_map_count=655360
# ---------------------------------------------------
docker run --name elasticsearch \
    --privileged \
-v /data/es:/usr/share/elasticsearch/data \
-e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
-e "http.host=0.0.0.0" \
-p 9200:9200 -p 9300:9300 \
-d docker.elastic.co/elasticsearch/elasticsearch-oss:6.8.2

# docker run --name g_es --privileged \
docker run --name elasticsearch --privileged \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "http.host=0.0.0.0" \
    -p 9200:9200 \
    -d docker.elastic.co/elasticsearch/elasticsearch-oss:6.8.2

#     _____ __     __               __
#    / __(_) /__  / /_  ___  ____ _/ /_
#   / /_/ / / _ \/ __ \/ _ \/ __ `/ __/
#  / __/ / /  __/ /_/ /  __/ /_/ / /_
# /_/ /_/_/\___/_.___/\___/\__,_/\__/
# filebeat

docker run --name filebeat\ # --link elasticsearch\
docker.elastic.co/beats/filebeat:7.6.0 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]


#  ██████╗ ██████╗  █████╗ ██╗   ██╗██╗      ██████╗  ██████╗
# ██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝██║     ██╔═══██╗██╔════╝
# ██║  ███╗██████╔╝███████║ ╚████╔╝ ██║     ██║   ██║██║  ███╗
# ██║   ██║██╔══██╗██╔══██║  ╚██╔╝  ██║     ██║   ██║██║   ██║
# ╚██████╔╝██║  ██║██║  ██║   ██║   ███████╗╚██████╔╝╚██████╔╝
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝  ╚═════╝
# graylog
# echo -n 123456 | sha256sum | awk '{print $1}'
DEVICE=enp0s3
# IPADDR=`ip -br address show dev $DEVICE | awk '{print substr($3,1,index($3,"/")-1);}'`;
GPASSWD=`echo -n 1qasde3 | sha256sum | awk '{print $1}'`;
IPADDR="192.168.0.48"
docker run --name graylog --link mongo --link elasticsearch  \
    -p 9000:9000 -p 12201:12201 -p 1514:1514 -p 5555:5555 \
    -e GRAYLOG_ROOT_PASSWORD_SHA2=$GPASSWD \
    -e GRAYLOG_HTTP_EXTERNAL_URI="http://$IPPADDR:9000/" \
    -d graylog/graylog:3.1

# https://github.com/Graylog2/graylog2-server/issues/1350
# 2020-03-09 03:55:59,798 WARN : org.graylog2.plugin.inputs.transports.AbstractTcpTransport - receiveBufferSize (SO_RCVBUF) for input GELFTCPInput{title=0-tcp, nodeId=24beb03d-207f-4a65-8755-39ea53d05925} (channel [id: 0x541d4f90, L:/0:0:0:0:0:0:0:0%0:5044]) should be 1048576 but is 425984.
# 2020-03-09 03:55:59,799 WARN : org.graylog2.inputs.transports.UdpTransport - receiveBufferSize (SO_RCVBUF) for input GELFUDPInput{title=24be, nodeId=24beb03d-207f-4a65-8755-39ea53d05925} (channel [id: 0x84d10374, L:/0:0:0:0:0:0:0:0%0:12201])                should be 262144 but is 425984.
sysctl -w net.core.rmem_max=262144





#        █████╗ ██████╗ ██╗   ██╗██╗███████╗ ██████╗ ██████╗
#       ██╔══██╗██╔══██╗██║   ██║██║██╔════╝██╔═══██╗██╔══██╗
#  ████╗███████║██║  ██║██║   ██║██║███████╗██║   ██║██████╔╝
# ██╔══╝██╔══██║██║  ██║╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██╗
# ╚████╗██║  ██║██████╔╝ ╚████╔╝ ██║███████║╚██████╔╝██║  ██║
#  ╚═══╝╚═╝  ╚═╝╚═════╝   ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
# cAdvisor
docker run \
--v /:/rootfs:ro \
--v /sys:/sys:ro \
--v /dev/disk/:/dev/disk:ro \
--v /var/run:/var/run:rw \
--v /var/lib/docker/:/var/lib/docker:ro \
--publish=8090:8080 \
--privileged=true \
--detach=true \
--name=cadvisor \
google/cadvisor:v0.24.1

#   ____  ____  ___  ____  ________  _____/￣/__  __
#  / __ \/ __ \/ _ \/ __ \/ ___/ _ \/ ___/ __/ / / /
# / /_/ / /_/ /  __/ / / / /  /  __(__  ) /_/ /_/ /
# \____/ .___/\___/_/ /_/_/   \___/____/\__/\__, /
#     /_/                                  /____/
# openresty
# docker run -d \
# --name="g_nginx" --privileged \
# -p 8008:80 \
# -v :/etc/nginx/nginx.conf \
# -v $PWD/openresty/config/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
# -v $PWD/openresty/logs:/usr/local/openresty/nginx/logs \
# openresty/openresty:1.9.15.1-trusty



docker run --rm --log-driver=gelf --log-opt gelf-address=udp://<GraylogIP>:12401 --log-opt tag=HelloWorld busybox echo Hello Graylog
docker run -d --privileged \
    --name g_nginx --log-driver=gelf \
    -p 8008:80 \
    --log-opt gelf-address=udp://192.168.0.48:12201 \
    --log-opt tag=prod_frontend \
    -v $PWD/nginx/logs/:/var/log/nginx/
    -v $PWD/nginx/vhost/configs:/etc/nginx/conf.d nginx:latest


#  _____              __
# /__  /  ___  ____  / /_____ _____
#   / /  / _ \/ __ \/ __/ __ `/ __ \
#  / /__/  __/ / / / /_/ /_/ / /_/ /
# /____/\___/_/ /_/\__/\__,_/\____/
# zentao
# -- Boren -- ## https://www.projectclub.com.tw/hard-power/collaboration/1098-zentao.html
# https://github.com/latelee/docker-compose/blob/master/zentao/docker-compose.yml
# https://github.com/idoop/zentao/blob/master/docker-compose.yaml
# https://www.liumapp.com/articles/2018/06/01/1527853767811.html/
http://192.168.0.55:9070/zentao/tutorial-index-aHR0cDovLzE5Mi4xNjguMC41NTo5MDcwL3plbnRhby90dXRvcmlhbC13aXphcmQtcHJvamVjdC1pbmRleC0uaHRtbA==-createProject.html


#    _____ __                  ____
#   / ___// /_  ____ _      __/ __ \____  _____
#   \__ \/ __ \/ __ \ | /| / / / / / __ \/ ___/
#  ___/ / / / / /_/ / |/ |/ / /_/ / /_/ / /__
# /____/_/ /_/\____/|__/|__/_____/\____/\___/
ShowDoc
# -- Boren -- # https://github.com/gnpok/showDoc
# https://www.jianshu.com/p/0efcc1792bff

git clone https://github.com/star7th/showdoc.git
cd showdoc
docker build -t showdoc ./

cat > ./showdoc.yml <<EOF
version: "2"
services:
  showdoc:
    image: showdoc:latest
    container_name: showdoc
    restart: always
    ports:
      - "4999:80"
    volumes:
     - "/alldata/showdoc_data:ro"
EOF

docker-compose -f showdoc2.yml up -d

[{bind  /alldata/showdoc/html /var/www/html   true rprivate}]
[{bind  /alldata/zentao/www /app/zentaopms   true rprivate} {bind  /alldata/zentao/db /var/lib/mysql   true rprivate}]
