# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:04 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBGGIWMH_BUILDLINK3_MK:=	${LIBGGIWMH_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libggiwmh
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibggiwmh}
BUILDLINK_PACKAGES+=	libggiwmh

.if !empty(LIBGGIWMH_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libggiwmh+=	libggiwmh>=0.2.0
BUILDLINK_ABI_DEPENDS.libggiwmh?=	libggiwmh>=0.2.1nb1
BUILDLINK_PKGSRCDIR.libggiwmh?=	../../graphics/libggiwmh
.endif	# LIBGGIWMH_BUILDLINK3_MK

.include "../../graphics/libggi/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
