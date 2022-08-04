# Notifiarr.com and friends.

server {
  server_name notifiarr.com www.notifiarr.com;
  access_log  /config/log/nginx/notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
  include  /config/nginx/apiauth.conf;

  location /proxyfiles/ {
    root /config/www;
  }
}
