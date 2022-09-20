# https://customsweetsntreats.com 
# The bakery website that rocks!

server {
  server_name customsweetsntreats.com *.customsweetsntreats.com;
  access_log  /config/log/nginx/customsweetsntreats.com/access.log normal;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream2.conf;
}
