# $NetBSD: Makefile,v 1.2 2011/05/28 10:15:14 cheusov Exp $

PKGNAME=	heirloom-libcommon-${HEIRLOOM_VER}
CATEGORIES=	devel

DEPENDS+=	heirloom-doc-${HEIRLOOM_VER}:../../sysutils/heirloom-doc

MAKE_FLAGS+=	SUBDIRS="libcommon"

INSTALLATION_DIRS+=	include/heirloom lib

HEADERS_DIR=	${PREFIX}/include/heirloom

HEADERS=	_alloca.h _malloc.h alloca.h asciitype.h atoll.h \
		blank.h getdir.h iblok.h malloc.h mbtowi.h memalign.h \
		msgselect.h oblok.h pathconf.h pfmt.h regexp.h regexpr.h \
		sfile.h sigset.h

PLIST_SUBST+=	NO_ALLOCA_H=
PLIST_SUBST+=	NOMALLOC_H=

.include "../../sysutils/heirloom-doc/Makefile.common"

DESCR_SRC+=	${.CURDIR}/DESCR

.if ${OPSYS} == "Linux" || ${OPSYS} == "SunOS" || ${OPSYS} == "Minix"
PLIST_SUBST+=	"NO_ALLOCA_H=@comment "
PLIST_SUBST+=	"NOMALLOC_H=@comment "
.endif

do-install:
.for i in ${HEADERS}
	if ${TEST} -r ${WRKSRC}/libcommon/${i}; then \
	   ${INSTALL_DATA} ${WRKSRC}/libcommon/${i} ${DESTDIR}${HEADERS_DIR}; \
	fi
.endfor
	${INSTALL_DATA} ${WRKSRC}/libcommon/libcommon.a \
		${DESTDIR}${PREFIX}/lib/libheirloomcommon.a

.include "../../mk/bsd.pkg.mk"
