# $NetBSD: Makefile,v 1.23 2012/10/08 09:20:58 asau Exp $
#

DISTNAME=	clutter-gst-1.2.0
PKGREVISION=	11
CATEGORIES=	multimedia
MASTER_SITES=	http://source.clutter-project.org/sources/clutter-gst/1.2/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.clutter-project.org/
COMMENT=	Clutter GStreamer integration
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	clutter-gst.pc.in

BUILDLINK_TRANSFORM+=	rm:-DG_DISABLE_DEPRECATED

.include "../../graphics/clutter/buildlink3.mk"
.include "../../multimedia/gstreamer0.10/buildlink3.mk"
.include "../../multimedia/gst-plugins0.10-base/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
