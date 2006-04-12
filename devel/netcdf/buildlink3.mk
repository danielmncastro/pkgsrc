# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:54 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NETCDF_BUILDLINK3_MK:=	${NETCDF_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	netcdf
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnetcdf}
BUILDLINK_PACKAGES+=	netcdf

.if !empty(NETCDF_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.netcdf+=	netcdf>=3.5
BUILDLINK_ABI_DEPENDS.netcdf+=	netcdf>=3.5.0nb2
BUILDLINK_PKGSRCDIR.netcdf?=	../../devel/netcdf
.endif	# NETCDF_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
