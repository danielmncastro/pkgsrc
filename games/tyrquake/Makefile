# $NetBSD: Makefile,v 1.3 2012/10/06 11:54:57 asau Exp $

DISTNAME=	tyrquake-0.61
CATEGORIES=	games x11
MASTER_SITES=	http://disenchant.net/files/engine/

MAINTAINER=	snj@NetBSD.org
HOMEPAGE=	http://disenchant.net/engine.html
COMMENT=	Conservative branch of Quake

LICENSE=	gnu-gpl-v2

USE_TOOLS+=	gmake

LDFLAGS+=	${LIBOSSAUDIO}

SUBST_CLASSES+=		audio
SUBST_STAGE.audio=	post-patch
SUBST_MESSAGE.audio=	Fixing path to the audio device.
SUBST_FILES.audio=	common/snd_linux.c
SUBST_SED.audio=	-e "s|/dev/dsp|${DEVOSSAUDIO}|"

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tyr-* ${DESTDIR}${PREFIX}/bin

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXxf86dga/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../x11/xf86dgaproto/buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
