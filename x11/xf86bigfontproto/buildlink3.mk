# $NetBSD: buildlink3.mk,v 1.1.1.1 2006/11/03 17:53:21 joerg Exp $

BUILDLINK_DEPMETHOD.xf86bigfontproto?=	build

BUILDLINK_TREE+=	xf86bigfontproto

.if !defined(XF86BIGFONTPROTO_BUILDLINK3_MK)
XF86BIGFONTPROTO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xf86bigfontproto+=	xf86bigfontproto>=1.1
BUILDLINK_PKGSRCDIR.xf86bigfontproto?=	../../x11/xf86bigfontproto
.endif # XF86BIGFONTPROTO_BUILDLINK3_MK

BUILDLINK_TREE+=	-xf86bigfontproto
