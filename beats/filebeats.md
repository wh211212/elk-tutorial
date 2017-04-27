# filebeat

> https://www.elastic.co/products/beats/filebeat
> 您拥有数十台，数百台甚至数千台服务器，虚拟机和生成日志的容器时，请勿使用SSH。 Filebeat可以通过提供轻量级的方式来转发和集中日志和文件来帮助您简单的简单操作

- 安装filebeat
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-x86_64.rpm
sudo rpm -vi filebeat-5.3.0-x86_64.rpm

sudo openssl req -subj '/CN=elk.aniu.co/' -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
