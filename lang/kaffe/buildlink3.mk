# $NetBSD: buildlink3.mk,v 1.2 2004/04/06 18:15:54 tv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
KAFFE_BUILDLINK3_MK:=	${KAFFE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	kaffe
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nkaffe}
BUILDLINK_PACKAGES+=	kaffe

.if !empty(KAFFE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.kaffe+=	kaffe-[0-9]*
BUILDLINK_PKGSRCDIR.kaffe?=	../../lang/kaffe
EVAL_PREFIX+=			BUILDLINK_JAVA_PREFIX.kaffe=kaffe
BUILDLINK_JAVA_PREFIX.kaffe=	${BUILDLINK_PREFIX.kaffe}/java/kaffe
BUILDLINK_CPPFLAGS.kaffe=				    \
	-I${BUILDLINK_JAVA_PREFIX.kaffe}/include	    \
	-I${BUILDLINK_JAVA_PREFIX.kaffe}/include/kaffe
.endif  # KAFFE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
