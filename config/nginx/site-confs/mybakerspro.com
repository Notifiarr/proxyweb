# mybakerspro.com

server {
    server_name mybakerspro.com *.mybakerspro.com;
    listen      443 ssl http2;
    access_log  /config/log/nginx/mybakerspro_access.log local;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    set $mybakerspro https://webserver.best.net;
    location    / {
        proxy_pass $mybakerspro$request_uri;
    }
}
