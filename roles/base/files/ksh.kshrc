#!/bin/ksh

case "$-" in
*i*)
	# we are interactive
	# we may have su'ed so reset these
	USER=$(id -un)
	UID=$(id -u)

	HOSTNAME=${HOSTNAME:-$(uname -n)}
	HOST=${HOSTNAME%%.*}
	tty=$(tty)
	tty=${tty##*/}
	TTY=${TTY:-$tty}

	# $console is the system console device
	console=$(sysctl kern.consdev)
	console=${console#*=}

	# set the histfile modification command
	HISTFILE=$HOME/.ksh_history
	HISTSIZE=5000
	HISTCONTROL=ignoredups:ignorespace

	# do we want window decorations?
	if [[ -n $ILS ]]; then
		function ilabel { print -n "${ILS}$*${ILE}">/dev/tty; }
		function label { print -n "${WLS}$*${WLE}">/dev/tty; }

		alias stripe='label "$USER@$HOST ($tty) - $PWD"'
		alias istripe='ilabel "$USER@$HOST ($tty)"'

		# Run stuff through this to preserve the exit code
		function _ignore { local rc=$?; "$@"; return $rc; }

		function wftp { ilabel "ftp $*"; "ftp" "$@"; _ignore eval istripe; }

		function wcd     { \cd "$@";     _ignore eval stripe; }

		function wssh    { \ssh "$@";    _ignore eval 'istripe; stripe'; }
		function wtelnet { \telnet "$@"; _ignore eval 'istripe; stripe'; }
		function wsu     { \su "$@";     _ignore eval 'istripe; stripe'; }

		alias su=wsu
		alias cd=wcd
		alias ftp=wftp
		alias ssh=wssh
		alias telnet=wtelnet
		eval stripe
		eval istripe
	fi

	# source the files from profile.d folder
	for sfile in /etc/profile.d/*.sh ; do
		. $sfile
	done
  ;;
esac

