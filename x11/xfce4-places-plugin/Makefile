# $NetBSD: Makefile,v 1.20 2012/10/29 05:07:09 asau Exp $

.include "../../meta-pkgs/xfce4/Makefile.common"

XFCE4_VERSION=	1.0.0

DISTNAME=	xfce4-places-plugin-${XFCE4_VERSION}
PKGREVISION=	17
CATEGORIES=	x11
MASTER_SITES=	http://goodies.xfce.org/releases/xfce4-places-plugin/
COMMENT=	Xfce Places plugin

.include "../../sysutils/xfce4-thunar/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
