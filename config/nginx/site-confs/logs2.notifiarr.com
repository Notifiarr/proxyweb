# test pastebin app

server {
  set $server http://10.1.0.226:8088;
  server_name logs2.notifiarr.com;
  access_log  /config/log/nginx/logs2.notifiarr.com/access.log normal;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  location / {
    proxy_pass $server$request_uri;
  }
}
