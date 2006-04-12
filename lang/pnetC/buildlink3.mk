# $NetBSD: buildlink3.mk,v 1.6 2006/04/06 06:22:13 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PNETC_BUILDLINK3_MK:=	${PNETC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pnetC
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NpnetC}
BUILDLINK_PACKAGES+=	pnetC

.if !empty(PNETC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pnetC+=	pnetC>=0.6.4
BUILDLINK_ABI_DEPENDS.pnetC?=	pnetC>=0.6.6nb2
BUILDLINK_PKGSRCDIR.pnetC?=	../../lang/pnetC
.endif	# PNETC_BUILDLINK3_MK

.include "../../lang/pnet/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
