# $NetBSD$

BUILDLINK_TREE+=	docbook-xml

.if !defined(DOCBOOK_XML_BUILDLINK3_MK)
DOCBOOK_XML_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.docbook-xml+=	docbook-xml>=4.5
BUILDLINK_PKGSRCDIR.docbook-xml?=	../../textproc/docbook-xml

BUILDLINK_CONTENTS_FILTER.docbook-xml=	${EGREP} '/docbook/'
.endif	# DOCBOOK_XML_BUILDLINK3_MK

BUILDLINK_TREE+=	-docbook-xml
