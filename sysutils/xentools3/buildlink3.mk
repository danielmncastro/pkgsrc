# $NetBSD: buildlink3.mk,v 1.1.1.1 2007/06/14 19:39:45 bouyer Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XENTOOLS3_BUILDLINK3_MK:=	${XENTOOLS3_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xentools3
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxentools3}
BUILDLINK_PACKAGES+=	xentools3
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xentools3

.if ${XENTOOLS3_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xentools3+=	xentools3>=3.1.2
BUILDLINK_PKGSRCDIR.xentools3?=	../../sysutils/xentools3
.endif	# XENTOOLS3_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
