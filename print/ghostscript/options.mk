# $NetBSD: options.mk,v 1.11 2010/12/23 11:44:54 dsainty Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.ghostscript
PKG_SUPPORTED_OPTIONS=	x11 cups debug fontconfig disable-compile-inits
PKG_SUGGESTED_OPTIONS=	x11 fontconfig

.include "../../mk/bsd.options.mk"

# (no_cidfmap)	when --disable-compile-inits selected,
#		cidfmap is renamed to cidfmap.dist
PLIST_VARS+=		no_cidfmap

.if !empty(PKG_OPTIONS:Mx11)
CONFIGURE_ARGS+=	--with-x
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-x
CONFIGURE_ARGS+=	--disable-freetype
.endif

PLIST_VARS+=		cups
.if !empty(PKG_OPTIONS:Mcups)
CONFIGURE_ARGS+=	--enable-cups
PLIST.cups=		yes
INSTALL_TARGET+=	install-cups

CUPS_CONFDIR?=	${PKG_SYSCONFBASEDIR}/cups
CUPS_EGDIR=	${PREFIX}/share/examples/cups
CONF_FILES+=	${CUPS_EGDIR}/gstoraster.convs ${CUPS_CONFDIR}/gstoraster.convs

SUBST_CLASSES+=		cupsetc
SUBST_STAGE.cupsetc=	post-extract
SUBST_MESSAGE.cupsetc=	Fixing CUPS etc directory path to install as example
SUBST_FILES.cupsetc=	cups/cups.mak
SUBST_SED.cupsetc=	-e 's|$$(CUPSSERVERROOT)|${CUPS_EGDIR}|g'

.include "../../print/cups/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-cups
.endif

.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if !empty(PKG_OPTIONS:Mfontconfig)
.include "../../fonts/fontconfig/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-fontconfig
CONFIGURE_ARGS+=	--disable-freetype
.endif

# Please note the same if condition is in post-extract: target in Makefile
.if !empty(PKG_OPTIONS:Mdisable-compile-inits)
CONFIGURE_ARGS+=        --disable-compile-inits
PLIST.no_cidfmap=	YES
.else
PLIST.cidfmap=		YES
.endif
