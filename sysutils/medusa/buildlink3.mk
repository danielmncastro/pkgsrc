# $NetBSD: buildlink3.mk,v 1.6 2006/04/06 06:22:45 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
MEDUSA_BUILDLINK3_MK:=	${MEDUSA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	medusa
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmedusa}
BUILDLINK_PACKAGES+=	medusa

.if !empty(MEDUSA_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.medusa+=	medusa>=0.5.1nb7
BUILDLINK_ABI_DEPENDS.medusa?=	medusa>=0.5.1nb9
BUILDLINK_PKGSRCDIR.medusa?=	../../sysutils/medusa
.endif	# MEDUSA_BUILDLINK3_MK

.include "../../sysutils/gnome-vfs/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
