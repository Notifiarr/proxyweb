# captain testing

server {
  set $server https://10.1.0.226;
  set $authproxy http://proxy.best.net:8080;
  server_name test.notifiarr.com;
  access_log  /config/log/nginx/test.notifiarr_access.log local;

  listen   443 ssl http2;
  include  /config/nginx/ssl.conf;
  include  /config/nginx/proxy.conf;

  location / {
    proxy_pass $server$request_uri;
  }

  location /api {
    auth_request /auth;
    auth_request_set $proxy_env $upstream_http_X_Environment;
    auth_request_set $auth_user $upstream_http_X_Username;
    auth_request_set $auth_idnt $upstream_http_X_UserID;

    proxy_set_header host $redirect_host;
    proxy_set_header x-api-key $remote_api_key;
    proxy_pass $server$request_uri;
  }

  location = /auth {
    internal;
    proxy_pass_request_body off;
    proxy_set_header Content-Length "";
    proxy_set_header X-Original-URI $request_uri;
    proxy_set_header X-API-Key $incoming_api_key;
    proxy_pass $authproxy/auth;
  }
}
