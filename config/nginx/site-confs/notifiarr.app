# Notifiarr.com and friends.

server {
  server_name *.notifiarr.app;
  access_log  /config/log/nginx/notifiarr_app_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
  include  /config/nginx/apiauth.conf;
}

server {
  server_name notifiarr.app;
  access_log  /config/log/nginx/notifiarr_app_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;

  location / {
     return 301 https://notifiarr.com;
  }
}
