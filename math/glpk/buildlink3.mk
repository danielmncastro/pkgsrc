# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:20 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GLPK_BUILDLINK3_MK:=	${GLPK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	glpk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nglpk}
BUILDLINK_PACKAGES+=	glpk

.if !empty(GLPK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.glpk+=	glpk>=4.8nb1
BUILDLINK_ABI_DEPENDS.glpk?=	glpk>=4.9nb1
BUILDLINK_PKGSRCDIR.glpk?=	../../math/glpk
.endif	# GLPK_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
