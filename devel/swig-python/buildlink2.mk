# $NetBSD: buildlink2.mk,v 1.2 2003/05/30 11:22:37 epg Exp $

.if !defined(SWIG_PYTHON_BUILDLINK2_MK)
SWIG_PYTHON_BUILDLINK2_MK=		#defined

BUILDLINK_PACKAGES+=			swig-python
BUILDLINK_DEPENDS.swig-python?=		swig-python>=${SWIG_VERSION}
BUILDLINK_PKGSRCDIR.swig-python?=	../../devel/swig-python

EVAL_PREFIX+=		BUILDLINK_PREFIX.swig-python=swig-python
BUILDLINK_PREFIX.swig-python_DEFAULT=	${LOCALBASE}

BUILDLINK_FILES.swig-python+=		lib/libswigpy.*

PYTHON_VERSION_ACCEPTED=		22 22pth
.include "../../lang/python/pyversion.mk"

.include "../../devel/swig-build/Makefile.version"

BUILDLINK_TARGETS+=			swig-python-buildlink

swig-python-buildlink: _BUILDLINK_USE

.endif	# SWIG_PYTHON_BUILDLINK2_MK
