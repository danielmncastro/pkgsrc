# $NetBSD: buildlink3.mk,v 1.18 2012/10/08 23:01:01 adam Exp $

BUILDLINK_TREE+=	qt4-qdbus

.if !defined(QT4_QDBUS_BUILDLINK3_MK)
QT4_QDBUS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qt4-qdbus+=	qt4-qdbus>=4.3.2
BUILDLINK_ABI_DEPENDS.qt4-qdbus+=	qt4-qdbus>=4.8.4
BUILDLINK_PKGSRCDIR.qt4-qdbus?=	../../x11/qt4-qdbus

.include "../../x11/qt4-libs/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.endif # QT4_QDBUS_BUILDLINK3_MK

BUILDLINK_TREE+=	-qt4-qdbus
