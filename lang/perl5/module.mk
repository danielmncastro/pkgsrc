# $NetBSD: module.mk,v 1.10 2003/07/30 15:12:28 jmmv Exp $
#
# This Makefile fragment is intended to be included by packages that build
# and install perl5 modules.
#
# The following targets are provided by this file:
#
# perl5-configure	runs the standard perl configuration in
#			each of the directories specified in
#			${PERL5_CONFIGURE_DIRS}.
#
# do-configure		runs the perl5-configure target; if PERL5_CONFIGURE
#			is set to "YES", then this target overrides the
#			default do-configure provided by bsd.pkg.mk.
#
# The following variables may be set prior to including this file:
#
# PERL5_CONFIGURE	if "YES", then for do-configure, run the standard
#			perl configuration assuming Makefile.PL exists;
#			defaults to "YES".
#
# PERL5_CONFIGURE_DIRS	list of directories in which to run the
#			standard perl configuration; defaults to
#			${CONFIGURE_DIRS}.
#
# PERL5_LDFLAGS		extra linker flags to pass on to the build
#			process.

.if !defined(_PERL5_MODULE_MK)
_PERL5_MODULE_MK=	# defined

BUILDLINK_DEPMETHOD.perl+=	full

.include "../../lang/perl5/buildlink2.mk"

PERL5_CONFIGURE?=	YES
PERL5_CONFIGURE_DIRS?=	${CONFIGURE_DIRS}

perl5-configure:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	for dir in ${PERL5_CONFIGURE_DIRS}; do				\
		if [ -f $$dir/Makefile.PL ]; then			\
			( cd $$dir && ${SETENV} ${MAKE_ENV}		\
			  ${PERL5} Makefile.PL ${MAKE_PARAMS});		\
		fi;							\
	done

.if defined(PERL5_CONFIGURE) && !empty(PERL5_CONFIGURE:M[yY][eE][sS])
.if target(do-configure)
do-configure: perl5-configure
.else
do-configure: perl5-configure
	${_PKG_SILENT}${_PKG_DEBUG}${DO_NADA}
.endif

# OTHERLDFLAGS is the hook provided by the perl5 MakeMaker module to allow
# customizing the LDFLAGS passed to the compiler/linker.
#
.if defined(PERL5_LDFLAGS) && !empty(PERL5_LDFLAGS)
FIX_RPATH+=	PERL5_LDFLAGS
LDFLAGS+=	${PERL5_LDFLAGS}
.  include "../../mk/bsd.prefs.mk"
.  if ${OBJECT_FMT} == "a.out"
MAKE_FLAGS+=	OTHERLDFLAGS="${LDFLAGS:S/-Wl,//g}"
.  else
MAKE_FLAGS+=	OTHERLDFLAGS="${LDFLAGS}"
.  endif
.endif

# Generate the PLIST from the files listed in PERL5_PACKLIST.
.if defined(PERL5_PACKLIST)
PERL5_PLIST_COMMENT= \
	( ${ECHO} "@comment The following lines are automatically generated"; \
	  ${ECHO} "@comment from the installed .packlist files." )
PERL5_PLIST_FILES= \
	( ${CAT} ${PERL5_PACKLIST}; for f in ${PERL5_PACKLIST}; do [ ! -f $$f ] || ${ECHO} $$f; done ) \
	| ${SED} -e "s,[ 	].*,," -e "s,/\./,/,g" -e "s,${PREFIX}/,," \
	| ${SORT} -u
PERL5_PLIST_DIRS= \
	( ${CAT} ${PERL5_PACKLIST}; for f in ${PERL5_PACKLIST}; do [ ! -f $$f ] || ${ECHO} $$f; done ) \
	| ${SED} -e "s,[ 	].*,," -e "s,/\./,/,g" -e "s,${PREFIX}/,," \
		-e "s,^,@unexec \${RMDIR} -p %D/," \
		-e "s,/[^/]*$$, 2>/dev/null || \${TRUE}," \
	| ${SORT} -ur
PERL5_GENERATE_PLIST=	${PERL5_PLIST_COMMENT}; \
			${PERL5_PLIST_FILES}; \
			${PERL5_PLIST_DIRS}
GENERATE_PLIST+=	${PERL5_GENERATE_PLIST};
.endif

# Default test target for perl5 modules
TEST_TARGET?=	test

.endif	# _PERL5_MODULE_MK
