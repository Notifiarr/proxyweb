# Notifiarr.com and friends.

server {
    server_name notifiarr.com *.notifiarr.com notifiarr.wiki *.notifiar.wiki discordnotifiarr.com *.discordnotifiarr.com;
    listen      443 ssl http2;
    access_log  /config/log/nginx/notifiarr_access.log local;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    set $notifiarr https://webserver.best.net;
    location    / {
        proxy_pass $notifiarr$request_uri;
    }
}
