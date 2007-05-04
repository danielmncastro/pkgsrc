# $NetBSD$

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
PY24_FUSE_BINDINGS_BUILDLINK3_MK:=	${PY24_FUSE_BINDINGS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py24-fuse-bindings
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy24-fuse-bindings}
BUILDLINK_PACKAGES+=	py24-fuse-bindings
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py24-fuse-bindings

.if ${PY24_FUSE_BINDINGS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.py24-fuse-bindings+=	py24-fuse-bindings>=0.2pre1
BUILDLINK_PKGSRCDIR.py24-fuse-bindings?=	../../filesystems/py-fuse-bindings
.endif	# PY24_FUSE_BINDINGS_BUILDLINK3_MK

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH:S/+$//}
