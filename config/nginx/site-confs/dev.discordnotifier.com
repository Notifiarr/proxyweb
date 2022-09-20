# legacy dev site, goes away in 2023.

server {
  server_name dev.discordnotifier.com;
  access_log  /config/log/nginx/discordnotifier.com/access.log withauth;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;

  location / {
    return 301 https://dev.notifiarr.app$request_uri;
  }

  include  /config/nginx/apiauth.conf;
}
