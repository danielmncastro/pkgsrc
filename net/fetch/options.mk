# $NetBSD: options.mk,v 1.1.1.1 2008/10/08 15:28:30 joerg Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.libfetch
PKG_SUPPORTED_OPTIONS=
PKG_SUGGESTED_OPTIONS=

.include "../../net/libfetch/buildlink3.mk"

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mopenssl)
MAKE_ENV+=		FETCH_WITH_OPENSSL=yes

.include "../../security/openssl/buildlink3.mk"
.else
MAKE_ENV+=		FETCH_WITH_OPENSSL=no
.endif
