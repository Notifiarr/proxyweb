# dev and test site, goes to new server.

server {
    server_name dev.notifiarr.com test.notifiarr.com;
    listen      443 ssl http2;
    access_log  /config/log/nginx/notifiarr_access.log local;
    include     /config/nginx/ssl.conf;
    include     /config/nginx/proxy.conf;
    set $notifiarr https://10.1.0.226;
    location    / {
        proxy_pass $notifiarr$request_uri;
    }
}
