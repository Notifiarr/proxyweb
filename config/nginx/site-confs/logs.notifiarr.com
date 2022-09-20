# pastebin app

server {
  server_name logs.notifiarr.com;
  access_log  /config/log/nginx/logs.notifiarr.com/access.log normal;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
}
