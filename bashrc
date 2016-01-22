export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/scripts:$PATH
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

### Set up some aliases
alias gitclean_preview="git branch --merged | grep -v '\*'"
alias gitclean="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
