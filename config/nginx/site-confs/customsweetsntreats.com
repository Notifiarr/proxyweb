# http://customsweetsntreats.com - TODO: make it work with backend SSL.

server {
  server_name customsweetsntreats.com *.customsweetsntreats.com;
  access_log  /config/log/nginx/customsweetsntreat_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream.conf;
}
