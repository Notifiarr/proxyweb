# pastebin app

server {
  server_name logs.notifiarr.com;
  access_log  /config/log/nginx/logs.notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
}
