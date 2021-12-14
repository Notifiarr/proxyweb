# Notifiarr.com and friends.

server {
    server_name notifiarr.com www.notifiarr.com discordnotifiarr.com www.discordnotifiarr.com;
    set $server https://10.1.0.212;
    access_log  /config/log/nginx/notifiarr_access.log local;

    listen      443 ssl http2;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    location    / {
        proxy_pass $server$request_uri;
    }
}
