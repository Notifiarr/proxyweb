# Notifiarr.com and friends.

server {
    server_name notifiarr.com www.notifiarr.com discordnotifiarr.com www.discordnotifiarr.com;
    listen      443 ssl http2;
    access_log  /config/log/nginx/notifiarr_access.log local;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    set $notifiarr https://10.1.0.212;
    location    / {
        proxy_pass $notifiarr$request_uri;
    }
}