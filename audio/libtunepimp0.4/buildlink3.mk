# $NetBSD: buildlink3.mk,v 1.1.1.1 2006/07/12 13:07:19 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBTUNEPIMP_BUILDLINK3_MK:=	${LIBTUNEPIMP_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libtunepimp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibtunepimp}
BUILDLINK_PACKAGES+=	libtunepimp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libtunepimp

.if ${LIBTUNEPIMP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libtunepimp+=	libtunepimp>=0.4.2
BUILDLINK_API_DEPENDS.libtunepimp+=	libtunepimp<0.5
BUILDLINK_PKGSRCDIR.libtunepimp?=	../../audio/libtunepimp0.4
.endif	# LIBTUNEPIMP_BUILDLINK3_MK

.include "../../audio/musicbrainz/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
