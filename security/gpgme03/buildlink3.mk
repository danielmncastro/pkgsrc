# $NetBSD: buildlink3.mk,v 1.2 2004/03/05 19:25:39 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GPGME03_BUILDLINK3_MK:=	${GPGME03_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gpgme03
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngpgme03}
BUILDLINK_PACKAGES+=	gpgme03

.if !empty(GPGME03_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gpgme03+=	gpgme03>=0.3.16
BUILDLINK_PKGSRCDIR.gpgme03?=	../../security/gpgme03

BUILDLINK_FILES.gpgme03+=	bin/gpgme03-config
BUILDLINK_TRANSFORM.gpgme03+=	-e 's|/gpgme03-config|/gpgme-config|g'
BUILDLINK_TRANSFORM.gpgme03+=	-e 's|/gpgme03.h|/gpgme.h|g'
BUILDLINK_TRANSFORM+=		l:gpgme:gpgme03
.endif	# GPGME03_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
