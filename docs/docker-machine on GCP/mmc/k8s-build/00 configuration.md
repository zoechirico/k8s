# haproxy

```
# Our server settings

frontend http_front
   bind *:3000
   stats uri /haproxy?stats
   default_backend http_back

backend http_back
   balance roundrobin
   server k8s 172.18.1.129:80 check




```