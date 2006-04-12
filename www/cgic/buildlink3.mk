# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:22:53 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
CGIC_BUILDLINK3_MK:=	${CGIC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cgic
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncgic}
BUILDLINK_PACKAGES+=	cgic

.if !empty(CGIC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cgic+=	cgic>=2.02nb1
BUILDLINK_PKGSRCDIR.cgic?=	../../www/cgic
.endif	# CGIC_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
