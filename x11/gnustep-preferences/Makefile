# $NetBSD: Makefile,v 1.37 2012/10/29 05:06:17 asau Exp $

DISTNAME=	Preferences-1.2.0
PKGNAME=	gnustep-${DISTNAME:S/P/p/}
PKGREVISION=	21
CATEGORIES=	x11 gnustep
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=prefsapp/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	adam@NetBSD.org
HOMEPAGE=	http://prefsapp.sourceforge.net/
COMMENT=	Application for setting preferences for the GNUstep system
LICENSE=	gnu-gpl-v2

USE_LANGUAGES=	objc

NO_CONFIGURE=	YES
USE_TOOLS+=	gmake
MAKE_FILE=	GNUmakefile
MAKE_JOBS_SAFE=	NO
MAKE_FLAGS+=	GNUSTEP_USER_DIR=${WRKDIR}/fake_home/GNUstep

FIX_GNUSTEP_INSTALLATION_DIR= yes
SUBST_FILES.gnustep_installation_dir+=	GNUmakefile.preamble
SUBST_FILES.gnustep_installation_dir+=	PrefsModule/GNUmakefile.preamble
SUBST_FILES.gnustep_installation_dir+=	Modules/Keyboard/GNUmakefile
SUBST_SED.gnustep_installation_dir+=	-e 's|\$$(GNUSTEP_SYSTEM_ROOT)/Library/Preferences|$${DESTDIR}${GNUSTEP_LIB_DIR}/Preferences|'

.include "../../x11/gnustep-back/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
