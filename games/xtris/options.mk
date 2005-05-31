# $NetBSD: options.mk,v 1.1 2005/05/31 21:46:06 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.xtris
PKG_SUPPORTED_OPTIONS=	inet6

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=        --enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif
