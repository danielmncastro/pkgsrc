# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:22:26 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
MING_BUILDLINK3_MK:=	${MING_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ming
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nming}
BUILDLINK_PACKAGES+=	ming

.if !empty(MING_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ming+=	ming>=0.2
BUILDLINK_PKGSRCDIR.ming?=	../../multimedia/ming
.endif	# MING_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
