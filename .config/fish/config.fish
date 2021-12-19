alias install="sudo apt install"
alias update="sudo apt update"
alias upgrade="update && sudo apt upgrade -y"

alias ls="ls -lh --color"
alias ll="ls -a"

if type -q exa
	alias ls="exa -lh --icons"
	alias ll="ls -a"
end

alias dev="ssh sjustin@ca1danube.sba.gov"

function config
	git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end



alias docs="cd /opt/iplanet/servers/docs/"
