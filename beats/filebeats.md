# filebeat

> https://www.elastic.co/products/beats/filebeat
> 您拥有数十台，数百台甚至数千台服务器，虚拟机和生成日志的容器时，请勿使用SSH。 Filebeat可以通过提供轻量级的方式来转发和集中日志和文件来帮助您简单的简单操作

- 安装filebeat
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-x86_64.rpm
sudo rpm -vi filebeat-5.3.0-x86_64.rpm

sudo openssl req -subj '/CN=elk.aniu.co/' -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt

#
curl -H 'Content-Type: application/json' -XPUT 'http://192.168.10.51:9200/_template/filebeat' -d@filebeat.template.json


#
curl -H 'Content-Type: application/json' -XPUT 'http://192.168.10.51:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json

curl -XPUT -u elastic '192.168.10.51:9200/_xpack/security/user/elastic/_password' -H "Content-Type: application/json" -d '{
  "password" : "anwg123."
}'

curl -XPUT -u elastic '192.168.10.51:9200/_template/filebeat' -H 'Content-Type: application/json' -d@/etc/filebeat/filebeat.template.json
