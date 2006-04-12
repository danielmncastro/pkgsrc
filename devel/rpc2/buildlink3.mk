# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:56 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
RPC2_BUILDLINK3_MK:=	${RPC2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	rpc2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrpc2}
BUILDLINK_PACKAGES+=	rpc2

.if !empty(RPC2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.rpc2+=	rpc2>=1.10
BUILDLINK_ABI_DEPENDS.rpc2+=	rpc2>=1.27nb1
BUILDLINK_PKGSRCDIR.rpc2?=	../../devel/rpc2
.endif	# RPC2_BUILDLINK3_MK

.include "../../devel/lwp/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
