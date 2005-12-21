#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: winbindd.sh,v 1.2 2005/11/14 08:05:27 jlam Exp $
#
# PROVIDE: winbindd
# REQUIRE: nmbd

. /etc/rc.subr

name="winbindd"
rcvar=$name
command="@PREFIX@/sbin/${name}"
required_vars="nmbd"
required_files="@SAMBA_ETCDIR@/smb.conf"
extra_commands="reload"
command_args="-B"

# load_rc_config_var() from /etc/rc.subr on the netbsd-3 branch, for
# the benefit of platforms with older versions of /etc/rc.subr.
#
load_rc_config_var()
{
	eval $(eval '(
		load_rc_config '$1' >/dev/null;
		if [ -n "${'$2'}" -o "${'$2'-UNSET}" != "UNSET" ]; then
			echo '$2'=\'\''${'$2'}\'\'';
		fi
	)' )
}

load_rc_config $name
load_rc_config_var nmbd nmbd
run_rc_command "$1"
