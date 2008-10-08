# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_SIP_BUILDLINK3_MK:=	${PY_SIP_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-sip
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-sip}
BUILDLINK_PACKAGES+=	py-sip
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-sip

.if ${PY_SIP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.py-sip+=	${PYPKGPREFIX}-sip>=4.7.7
BUILDLINK_PKGSRCDIR.py-sip?=	../../x11/py-sip
.endif	# PY_SIP_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
