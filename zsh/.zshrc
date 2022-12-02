# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git tmux autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias school='cd ~/Documents/ESILV/A5'
    alias diff='diff --color=auto'
    alias ip='ip -c'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cryptohack="docker run -p 127.0.0.1:8888:8888 -it hyperreality/cryptohack"
alias x='xdg-open'
alias htb='sudo openvpn /home/joytide/htb/lab_Joytide.ovpn'
alias clipboard='xclip -selection clipboard'
alias nano='vim'
alias metasploit="docker run --rm -it -p 4444:4444 -p 80:80 -p 8080:8080 -p 443:443 -p 445:445 -p 8081:8081 strm/metasploit"



function volatility() {
  docker run -it --rm -v $(pwd):/data:ro -v $(pwd)/profiles:/plugins blacktop/volatility --plugins=/plugins $@
}

function rsactftool() {
  docker run -it --rm -v $(pwd):/data razaborg/rsactftool $@
}
# Rust

. "$HOME/.cargo/env"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/openssl-1.1.1o/"

# Go
export PATH="$HOME/go/bin:$PATH"