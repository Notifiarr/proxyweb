# mybakerspro.com

server {
  server_name mybakerspro.com *.mybakerspro.com;
  access_log  /config/log/nginx/mybakerspro.com/access.log normal;
  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;
  include  /config/nginx/upstream2.conf;
}
