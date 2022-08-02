# dev site

server {
  server_name dev.notifiarr.com;
  access_log  /config/log/nginx/dev.notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
  include  /config/nginx/apiauth.conf;
}
