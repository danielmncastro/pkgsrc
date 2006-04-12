# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:52 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOOP_BUILDLINK3_MK:=	${LIBOOP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	liboop
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nliboop}
BUILDLINK_PACKAGES+=	liboop

.if !empty(LIBOOP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.liboop+=	liboop>=0.9
BUILDLINK_ABI_DEPENDS.liboop+=	liboop>=1.0nb1
BUILDLINK_PKGSRCDIR.liboop?=	../../devel/liboop
.endif	# LIBOOP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
