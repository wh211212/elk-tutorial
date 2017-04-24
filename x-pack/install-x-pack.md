#
/etc/init.d/elasticsearch stop
/usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack

bin/elasticsearch-plugin remove x-pack

/etc/init.d/kibana stop
/usr/share/kibana/bin/kibana-plugin install x-pack

默认情况下，kibana用户密码设置为changeme。通过重置密码API更改此密码：
