# dev and test site, goes to new server.

server {
  set $server https://10.1.0.226;
  server_name dev.notifiarr.com test.notifiarr.com;
  access_log  /config/log/nginx/dev.notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  location / {
    proxy_pass $server$request_uri;
  }
}
