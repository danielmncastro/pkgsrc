# $NetBSD$

.if ${OPSYS} == "Darwin"
PKG_DEFAULT_OPTIONS+=	althash
.endif

PKG_OPTIONS_VAR=	PKG_OPTIONS.ezmlm
PKG_SUPPORTED_OPTIONS=	althash
.include "../../mk/bsd.options.mk"

###
### alternate subscriber hashing scheme for case-insensitive filesystems
###
.if !empty(PKG_OPTIONS:Malthash)
post-patch:
	@cd ${WRKSRC} && ${PATCH} ${PATCH_ARGS} < ${FILESDIR}/patch-althash
.endif
