# legacy website. still taking api reqs, goes away in 2023.
server {
  server_name discordnotifier.com www.discordnotifier.com;
  access_log  /config/log/nginx/discordnotifier.com/access.log withauth;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;

  location = / {
    return 301 https://notifiarr.com$request_uri;
  }

  set $notifiarr_upstream http://10.1.0.226;

  location / {
    proxy_set_header Host notifiarr.com;
    proxy_pass $notifiarr_upstream$request_uri; 
  }

  include  /config/nginx/apiauth.conf;
}
