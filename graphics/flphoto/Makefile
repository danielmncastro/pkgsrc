# $NetBSD: Makefile,v 1.23 2012/11/15 13:44:14 gdt Exp $
#

DISTNAME=		flphoto-1.2-source
PKGNAME=		flphoto-1.2
PKGREVISION=		16
CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=fltk/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.easysw.com/~mike/flphoto/index.html
COMMENT=		Image management and display program

WRKSRC=		${WRKDIR}/flphoto-1.2
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

LIBS.DragonFly= 	-lstdc++

.include "../../x11/fltk13/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../print/cups/buildlink3.mk"
.include "../../devel/libgphoto2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
