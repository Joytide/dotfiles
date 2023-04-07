# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ -z "$TMUX" ]; then
  # get the number of sessions
  num_sessions=$(tmux list-sessions | wc -l | tr -d ' ')

  # find the first unattached session and attach to it
  unattached_session=$(tmux list-sessions -F "#{session_name} #{session_attached}" | awk '$2=="0" {print $1; exit}')
  if [ -n "$unattached_session" ]; then
    tmux attach-session -t "$unattached_session"
    exit
  fi

  # if all sessions are attached, create a new session with the next integer
  session_name=$((num_sessions))
  tmux new-session -A -s "$session_name"
fi



# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# .oh-my-zsh/themes/joytide.zsh-theme
ZSH_THEME="joytide"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git tmux autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -A --color=auto'
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
alias ls='ls -A --color=auto'
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

function activate() {
  source $HOME/venvs/$1/bin/activate
}

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
# Ruby
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/openssl-1.1.1o/"
fi

# Go
if [ -d "$HOME/go" ]; then
  export PATH="$HOME/go/bin:$PATH"
fi

# More paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/sbin"
