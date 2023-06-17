#!/usr/bin/sh

NGX_VERSION='nginx-1.24.0'

wget https://nginx.org/download/$NGX_VERSION.tar.gz
tar -xf $NGX_VERSION.tar.gz
patch -d $NGX_VERSION/ -Np0 < ngx_http_core_module.c.patch
patch -d $NGX_VERSION/ -Np0 < ngx_http_core_module.h.patch
patch -d $NGX_VERSION/ -Np0 < ngx_http_header_filter_module.c.patch
patch -d $NGX_VERSION/ -Np0 < ngx_http_special_response.c.patch
patch -d $NGX_VERSION/ -Np0 < ngx_http_v2_filter_module.c.patch
