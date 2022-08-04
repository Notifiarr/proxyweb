# legacy dev site

server {
  server_name dev.discordnotifier.com;
  access_log  /config/log/nginx/dev.notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;

  location / {
    return 301 https://dev.notifiarr.app$request_uri;
  }

  include  /config/nginx/apiauth.conf;
}
