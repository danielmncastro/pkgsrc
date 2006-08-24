# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 23:10:39 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CROSS_BINUTILS_BUILDLINK3_MK:=	${CROSS_BINUTILS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cross-binutils
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncross-binutils}
BUILDLINK_PACKAGES+=	cross-binutils
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}cross-binutils

.if !empty(CROSS_BINUTILS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cross-binutils+=	cross-binutils>=2.17.0.0
BUILDLINK_PKGSRCDIR.cross-binutils?=	../../cross/binutils
.endif	# CROSS_BINUTILS_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
