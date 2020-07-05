alias p='ps -l'
alias j=jobs
alias o='fg %-'

alias vim="nvim"
alias dvim="doas nvim"

alias df='df -kh'
alias du='du -kh'

alias rsize='eval $(resize)'
alias hist='fc -l | more'

alias ls='ls -F'
alias l="ls -lh"
alias ll="ls -lh"
alias la="ls -lha"

alias netr="netstat -rnf inet"
alias netp="netstat -anf inet"

# get global WAN IP
alias wanip="curl https://ipinfo.io/ip"

# get term name
alias term="printf "%s\n%s\n", $TERM, $SHELL"

# pretty print the path one per line
alias path="awk 'BEGIN{ _path=ENVIRON[\"PATH\"]; gsub(/:/,\"\n\",_path); printf \"%s\n\", _path }'"

# list the open ports
alias openports='fstat | grep internet | grep -v 127.0.0 | sort -u | awk "{print \$9 }" | sort -u' 

