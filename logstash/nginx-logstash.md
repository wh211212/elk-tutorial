#

input {
    file {
        path => ["/var/log/nginx/elk.aniu.co.access.log"]
        type => "nginx-access"
    }
    file {
        path => ["/var/log/nginx/elk.aniu.co.error.log"]
        type => "nginx-error"
    }
}

output {
    stdout {
      codec => rubydebug
    }
    if [type] == "nginx-access" {
       elasticsearch {
            hosts => "192.168.10.51:9200"
            index =>  "nginxaccess-%{+YYYY.MM.dd}"
            document_type => "false"
            user => elastic
            password => anwg123.
        }
    }
    else if [type] == "nginx-error" {
        elasticsearch {
            hosts => "192.168.10.51:9200"
            index => "nginxerror-%{+YYYY.MM.dd}"
            document_type => "false"
            user => elastic
            password => anwg123.
        }
    }
}
