# $NetBSD: Makefile,v 1.32 2012/09/15 10:05:27 obache Exp $
#

DISTNAME=	gmime-2.2.25
PKGREVISION=	6
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gmime/2.2/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://spruce.sourceforge.net/gmime/
COMMENT=	Library for the creation and parsing of MIME messages
LICENSE=	gnu-lgpl-v2.1

USE_PKGLOCALEDIR=	yes
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-gtk-doc=no
CONFIGURE_ARGS+=	--disable-mono
PKGCONFIG_OVERRIDE+=	gmime-2.0.pc.in
TEST_TARGET=		check

.include "options.mk"

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
