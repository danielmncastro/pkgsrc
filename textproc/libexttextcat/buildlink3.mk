# $NetBSD$

BUILDLINK_TREE+=	libexttextcat

.if !defined(LIBEXTTEXTCAT_BUILDLINK3_MK)
LIBEXTTEXTCAT_BUILDLINK3_MK:=
BUILDLINK_API_DEPENDS.libexttextcat+=	libexttextcat>=3.2
BUILDLINK_PKGSRCDIR.libexttextcat?=	../../textproc/libexttextcat
.endif

BUILDLINK_TREE+=	-libexttextcat
