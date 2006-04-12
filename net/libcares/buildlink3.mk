# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:22:33 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBCARES_BUILDLINK3_MK:=	${LIBCARES_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libcares
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibcares}
BUILDLINK_PACKAGES+=	libcares

.if !empty(LIBCARES_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libcares+=	libcares>=1.3.0
BUILDLINK_PKGSRCDIR.libcares?=	../../net/libcares
.endif	# LIBCARES_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
