# https://customsweetsntreats.com

server {
    server_name customsweetsntreats.com *.customsweetsntreats.com;
    listen      443 ssl http2;
    access_log  /config/log/nginx/notifiarr_access.log local;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    set $sweet  https://webserver.best.net;
    location    / {
        proxy_pass $sweet$request_uri;
    }
}
