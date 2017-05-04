#
/etc/init.d/elasticsearch stop
/usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack

bin/elasticsearch-plugin remove x-pack

/etc/init.d/kibana stop
/usr/share/kibana/bin/kibana-plugin install x-pack

默认情况下，kibana用户密码设置为changeme。通过重置密码API更改此密码：




#
curl -XPUT -u elastic '192.168.10.51:9200/_xpack/security/user/elastic/_password' -H "Content-Type: application/json" -d '{
  "password" : "elasticpassword"
}'

curl -XPUT -u elastic '192.168.10.51:9200/_xpack/security/user/kibana/_password' -H "Content-Type: application/json" -d '{
  "password" : "kibanapassword"
}'

curl -XPUT -u elastic '192.168.10.51:9200/_xpack/security/user/logstash_system/_password' -H "Content-Type: application/json" -d '{
  "password" : "logstashpassword"
}'
kibanapassword

http://localhost:9200

curl -XPUT -u elastic '192.168.10.51:9200/_xpack/security/user/logstash_system/_enable'

> 设置角色和用户来控制对Elasticsearch和Kibana的访问。 例如，要授予John Doe完全访问匹配模式事件*的所有索引，并使他能够为Kibana中的索引创建可视化和仪表板，您可以创建一个events_admin角色，并将角色分配给新的johndoe用户。

curl -XPOST -u elastic '192.168.10.51:9200/_xpack/security/role/events_admin' -H "Content-Type: application/json" -d '{
  "indices" : [
    {
      "names" : [ "events*" ],
      "privileges" : [ "all" ]
    },
    {
      "names" : [ ".kibana*" ],
      "privileges" : [ "manage", "read", "index" ]
    }
  ]
}'

curl -XPOST -u elastic '192.168.10.51:9200/_xpack/security/user/wanghui' -H "Content-Type: application/json" -d '{
  "password" : "anwg123.",
  "full_name" : "wanghui",
  "email" : "hwang@aniu.tv",
  "roles" : [ "events_admin" ]
}'


#
curl -XGET -u elastic '192.168.10.51:9200/_xpack/security/user'

curl -u elastic -H 'Content-Type: application/json' -XPUT 'http://192.168.10.51:9200/_template/packetbeat' -d@/etc/packetbeat/packetbeat.template.json


-user user -pass password

/usr/share/packetbeat/scripts/import_dashboards -es http://192.168.33.60:9200 -user elastic -pass elasticpassword
#
./scripts/import_dashboards -es https://xyz.found.io -user user -pass password
./scripts/import_dashboards -es https://xyz.found.io -user admin -pass $(cat ~/pass-file)
