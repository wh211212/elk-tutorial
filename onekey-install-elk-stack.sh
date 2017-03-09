#!/bin/bash
##########################################################################
# Script Name: onekey-install-elk-stack.sh
# Author: shaon
# Email: shaonbean@qq.com
# Created Time: Wed 08 Mar 2017 11:40:46 AM CST
#########################################################################
# Blog address: http://blog.csdn.net/wh211212
#########################################################################
# Functions:  #
# Define some variables:  #
port=22
user=root
host=192.168.0.103
rpmdir=/usr/local/src
rpmjdk=jdk-8u121-linux-x64.rpm

# shell color
red='\e[0;31m' # 红色
RED='\e[1;31m'
green='\e[0;32m' # 绿色
GREEN='\e[1;32m'
blue='\e[0;34m' # 蓝色
BLUE='\e[1;34m'
purple='\e[0;35m' # 紫色
PURPLE='\e[1;35m'
NC='\e[0m' # 没有颜色

# install jdk
scp -P$port $user@$host:$rpmdir/$rpmjdk $rpmdir
cd $rpmdir && yum localinstall $rpmjdk -y
java -version > /dev/null 2>&1
if [ $? -eq 0 ];then
  echo 'jdk install succeed!'
else
  echo 'jdk install failed!'
  exit 2
fi

# add elk repo
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
echo '[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
' | sudo tee /etc/yum.repos.d/elasticsearch.repo
echo '\e[0;31m elk repo add succeed. \e[0;31m'

# install elasticsearch Kibana
yum makecache
yum install elasticsearch -y && yum install kibana -y

# add nginx repo && install nginx
echo '[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
#https://www.nginx.com/resources/wiki/start/topics/tutorials/install/
' | sudo tee /etc/yum.repos.d/nginx.repo
#
yum install nginx httpd-tools -y
echo '\e[0;31m nginx repo add and install succeed. \e[0;31m'
