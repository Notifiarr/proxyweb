# legacy dev site, goes away when we migrate users off.

server {
  server_name dev.notifiarr.com;
  access_log  /config/log/nginx/dev.notifiarr.com/access.log withauth;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;

  location = / {
    return 301 https://dev.notifiarr.app$request_uri;
  }

  include  /config/nginx/upstream.conf;
  include  /config/nginx/apiauth.conf;
}
