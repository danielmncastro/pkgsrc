# $NetBSD: buildlink3.mk,v 1.7 2006/04/06 06:22:23 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBCDIO_BUILDLINK3_MK:=	${LIBCDIO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libcdio
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibcdio}
BUILDLINK_PACKAGES+=	libcdio

.if !empty(LIBCDIO_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libcdio+=	libcdio>=0.65
BUILDLINK_ABI_DEPENDS.libcdio+=	libcdio>=0.76nb1
BUILDLINK_PKGSRCDIR.libcdio?=	../../misc/libcdio
.endif	# LIBCDIO_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
