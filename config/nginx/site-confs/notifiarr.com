# Notifiarr.com and friends.

server {
  set $server https://10.1.0.226;
  server_name notifiarr.com www.notifiarr.com discordnotifier.com www.discordnotifier.com;
  access_log  /config/log/nginx/notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  location / {
    proxy_set_header x-api-key $remote_api_key;
    proxy_pass $server$request_uri;
  }
  location /proxyfiles/ {
    root /config/www;
  }
}
