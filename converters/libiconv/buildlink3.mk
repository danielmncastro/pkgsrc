# $NetBSD: buildlink3.mk,v 1.17 2004/03/16 18:23:27 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ICONV_BUILDLINK3_MK:=	${ICONV_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	iconv
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Niconv}
BUILDLINK_PACKAGES+=	iconv

.if !empty(ICONV_BUILDLINK3_MK:M+)
BUILDLINK_PKGBASE.iconv?=	libiconv
BUILDLINK_DEPENDS.iconv+=	libiconv>=1.9.1
BUILDLINK_PKGSRCDIR.iconv?=	../../converters/libiconv
BUILDLINK_LDFLAGS.iconv=	${BUILDLINK_LDADD.iconv}
.endif	# ICONV_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
