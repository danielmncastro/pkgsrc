#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: qmail.sh,v 1.2 2002/09/20 02:01:57 grant Exp $
#

# PROVIDE: mail qmail
# REQUIRE: LOGIN

. /etc/rc.subr

name="qmail"
rcvar=${name}
required_files="@QMAILDIR@/control/me"
command="@QMAILDIR@/bin/qmail-send"
start_precmd="qmail_precmd"
extra_commands="reload"

if [ -z "$qmail_flags" ]; then
	qmail_flags="./Mailbox"
fi

qmail_precmd()
{
	command="@SETENV@ - PATH=@QMAILDIR@/bin:$PATH qmail-start '$qmail_flags' splogger qmail"
	command_args="&"
	rc_flags=""
}

load_rc_config $name
run_rc_command "$1"
