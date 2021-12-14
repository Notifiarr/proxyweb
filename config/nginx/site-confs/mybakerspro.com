# mybakerspro.com

server {
    set $server https://10.1.0.212;
    server_name mybakerspro.com *.mybakerspro.com;
    access_log  /config/log/nginx/mybakerspro_access.log local;

    listen      443 ssl http2;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    location    / {
        proxy_pass $server$request_uri;
    }
}
