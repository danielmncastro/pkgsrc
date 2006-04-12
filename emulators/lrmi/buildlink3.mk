# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:21:59 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LRMI_BUILDLINK3_MK:=	${LRMI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	lrmi
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlrmi}
BUILDLINK_PACKAGES+=	lrmi

.if !empty(LRMI_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.lrmi+=	lrmi>=0.8nb1
BUILDLINK_PKGSRCDIR.lrmi?=	../../emulators/lrmi
.endif	# LRMI_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
