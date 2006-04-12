# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:21:35 reed Exp $
#

BUILDLINK_DEPMETHOD.libdca?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBDTS_BUILDLINK3_MK:=	${LIBDTS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libdca
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibdca}
BUILDLINK_PACKAGES+=	libdca

.if !empty(LIBDTS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libdca+=	libdca>=0.0.2
BUILDLINK_PKGSRCDIR.libdca?=	../../audio/libdca
.endif	# LIBDTS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
