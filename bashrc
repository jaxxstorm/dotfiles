export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/scripts:$PATH
alias ls="ls -FG"
export PATH=$HOME/bin:$PATH
alias ls="ls --color"
# set the terminal prompt command
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'

# If there's a local copy of git, use that
if [[ -x $HOME/bin/git ]]; then
    alias git=$HOME/bin/git
fi
source ~/.bash_profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
