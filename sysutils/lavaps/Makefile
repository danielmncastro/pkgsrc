# $NetBSD: Makefile,v 1.35 2012/10/23 10:24:10 wiz Exp $
#

DISTNAME=	lavaps-2.7
PKGREVISION=	3
CATEGORIES=	sysutils x11
MASTER_SITES=	http://www.isi.edu/~johnh/SOFTWARE/LAVAPS/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.isi.edu/~johnh/SOFTWARE/LAVAPS/
COMMENT=	Lava lamp of currently running processes

MAKE_JOBS_SAFE=		no

USE_LANGUAGES=	c c++
USE_TOOLS+=	perl pod2man pod2html

GNU_CONFIGURE=	YES
CONFIGURE_ARGS+=--with-tcltk \
		--with-tcl-ver=8.5.12 \
		--with-tk-ver=8.5.12 \
		--with-tcltk-lib-suffix-type=nodot

# prevents the GConf schema from going into / when building the tcl/tk version
MAKE_ENV+=	PKGSRC_INSTALL_SCHEMAS=no

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../x11/tk/buildlink3.mk"
.include "../../lang/tcl/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
