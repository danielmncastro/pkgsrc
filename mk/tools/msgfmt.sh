#!/bin/sh
#
# $NetBSD: msgfmt.sh,v 1.16 2006/05/20 22:06:34 jlam Exp $
#
# Copyright (c) 2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#
# Copyright (c) 2004, 2005, 2006 Julio M. Merino Vidal <jmmv@NetBSD.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
# 3. Neither the name of author nor the names of its contributors may
#    be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

: ${AWK=awk}
: ${CAT=cat}
: ${MSGFMT=/usr/bin/msgfmt}
: ${TEE=tee}

case "${MSGFMT}" in
/*)	;;
*)	echo 1>&2 "$0: \`\`${MSGFMT}'' must be an absolute pathname."
	exit 1
	;;
esac
if test ! -x "${MSGFMT}"; then
	echo 1>&2 "$0: \`\`${MSGFMT}'' does not exist."
	exit 1
fi

# Parse the command line options.
version=
pofile=
debug=
cmd="${MSGFMT}"
while test $# -gt 0; do
	case "$1" in
	--debug)
		debug=yes; shift
		;;
	--version)
		version="$1"
		cmd="$cmd $1"; shift
		;;
	-[aDo]|--alignment|--directory|--output-file)
		cmd="$cmd $1 $2"; shift; shift;
		;;
	[!-]*)
		pofile="$1"
		cmd="$cmd -"; shift
		;;
	*)
		cmd="$cmd $1"; shift
		;;
	esac
done

# If we are asked for just the version, then avoid spawning awk.
test -z "$version" || exec $cmd
test -n "$pofile" || exec $cmd

# If --debug is specified, then dump the output from the awk script
# to $pofile.debug along the way.
#
if test -z "$debug"; then
	debug="${CAT}"
else
	debug="${TEE} $pofile.debug"
fi

${CAT} $pofile | ${AWK} '
BEGIN {
	OBSOLETE = "#~ "
	OBSOLETE_RE = "^(#~[ 	]+)?"
	OBSOLETE_RE_MATCH = "^#~[ 	]+"
	MSG_CONTINUATION_RE = OBSOLETE_RE "[ 	]*\""

	result = getline
	if (result < 1) exit result

	s = 0
	p = 0
	obsolete = ""

	while (result == 1) {
		# Buffer any "msgid" statements into the singular array.
		MSGID_RE = OBSOLETE_RE "msgid[ 	]+"
		if ($0 ~ MSGID_RE) {
			if ($0 ~ OBSOLETE_RE_MATCH) obsolete = OBSOLETE
			sub(MSGID_RE, "");
			s = 0
			singular[s++] = $0
			while (result = getline) {
				if ($0 ~ OBSOLETE_RE "$") continue
				if ($0 !~ MSG_CONTINUATION_RE) break
				sub(OBSOLETE_RE , "")
				singular[s++] = $0
			}
			if (result < 0) break
			continue
		}

		# Buffer any "msgid_plural" statements into the plural array.
		MSGID_PLURAL_RE = OBSOLETE_RE "msgid_plural[ 	]+"
		if ($0 ~ MSGID_PLURAL_RE) {
			if ($0 ~ OBSOLETE_RE_MATCH) obsolete = OBSOLETE
			sub(MSGID_PLURAL_RE, "");
			p = 0
			plural[p++] = $0
			while (result = getline) {
				if ($0 ~ OBSOLETE_RE "$") continue
				if ($0 !~ MSG_CONTINUATION_RE) break
				sub(OBSOLETE_RE, "")
				plural[p++] = $0
			}
			if (result < 0) break
			continue
		}

		# If we see "msgstr", then we are outputting the
		# translation of a singular form of a message, so dump
		# the contents of the singular array and output the
		# "msgstr" translation.
		#
		MSGSTR_RE = OBSOLETE_RE "msgstr[ 	]*\""
		if ($0 ~ MSGSTR_RE) {
			if (s > 0) {
				print obsolete "msgid " singular[0]
				for (i = 1; i < s; i++)
					print obsolete singular[i]
			}
			obsolete = ""
			print $0
			while (result = getline) {
				if ($0 !~ MSG_CONTINUATION_RE) break
				print $0
			}
			if (result < 0) break
			continue
		}

		# If we see "msgstr[0]", then we are outputting the
		# translation of a singular form of a message, so dump
		# the contents of the singular array and output the
		# "msgstr[0]" translation.
		#
		MSGSTR0_RE = OBSOLETE_RE "msgstr[[]0[]][ 	]+"
		if ($0 ~ MSGSTR0_RE) {
			if (s > 0) {
				print obsolete "msgid " singular[0]
				for (i = 1; i < s; i++)
					print obsolete singular[i]
			}
			sub(MSGSTR0_RE, "");
			print obsolete "msgstr " $0
			obsolete = ""
			while (result = getline) {
				if ($0 !~ MSG_CONTINUATION_RE) break
				print $0
			}
			if (result < 0) break
			continue
		}

		# If we see "msgstr[1]", then we are outputting the
		# translation of a plural form of a message, so dump
		# the contents of the plural array and output the
		# "msgstr[1]" translation.
		#
		MSGSTR1_RE = OBSOLETE_RE "msgstr[[]1[]][ 	]+"
		if ($0 ~ MSGSTR1_RE) {
			#
			# Check if the singular and plural arrays are equal.
			# If they are, then we do not need to output an
			# additional plural translation at all since the
			# "singular" form is already correct.
			#
			equal = 0
			if (s == p) {
				equal = 1;
				for (i = 0; i < s; i++) {
					if (singular[i] != plural[i]) {
						equal = 0; break
					}
				}
			}
			if (equal == 1) {
				while (result = getline) {
					if ($0 !~ MSG_CONTINUATION_RE) break
				}
				if (result < 0) break
				s = 0; p = 0
				continue
			}

			if (p > 0) {
				print obsolete "msgid " plural[0]
				for (i = 1; i < p; i++)
					print obsolete plural[i]
			}
			sub(MSGSTR1_RE, "");
			print obsolete "msgstr " $0
			obsolete = ""
			while (result = getline) {
				if ($0 !~ MSG_CONTINUATION_RE) break
				print $0
			}
			if (result < 0) break
			continue
		}

		# We drop all other "msgstr[N]" translations since the
		# old format only supported a single translation per
		# plural form.
		#
		MSGSTRN_RE = OBSOLETE_RE "msgstr[[]([2-9]|[1-9][0-9]+)[]][ 	]+"
		if ($0 ~ MSGSTRN_RE) {
			while (result = getline) {
				if ($0 !~ MSG_CONTINUATION_RE) break
				print $0
			}
			if (result < 0) break
			continue
		}

		# Pass everything else verbatim.
		print $0
		result = getline
		if (result < 0) break
	}
}
' | $debug | $cmd
