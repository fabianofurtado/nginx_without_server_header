# nginx_without_server_header
NGINX version **1.28.0** patches to use reverse proxy without HTTP server header

## Changes
`server_tokens` directive:
- `server_tokens` default value is now `off`
- `server_tokens off;`: **HTTP server header** removed from http header response
- `server_tokens on;`: default header `Server: ws`
- `server_tokens build;` is no longer valid

## Compatible Versions
This patch has been tested on NGINX version 1.28.0 and is expected to be compatible with other 1.28.x releases.

## Patching the NGINX original source code

    $ git clone https://github.com/fabianofurtado/nginx_without_server_header
    $ cd nginx_without_server_header/

At this point, you could run `ngx_patch.sh` or could execute manually these commands below:

    $ wget https://nginx.org/download/nginx-1.28.0.tar.gz
    $ tar -xf nginx-1.28.0.tar.gz
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_core_module.c.patch
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_core_module.h.patch
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_header_filter_module.c.patch
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_special_response.c.patch
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_v2_filter_module.c.patch
    $ patch -d nginx-1.28.0/ -Np0 < ngx_http_v3_filter_module.c.patch

Your NGINX code is now patched! Compile it and enjoy!
