# Path to your oh-my-zsh installation.
export ZSH=/Users/lbriggs/.oh-my-zsh
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_MODE='awesome-patched'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh/customizations

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery brew bash-completion rvm zsh-syntax-highlighting virtualenv kubectl gpg pyenv)

# User configuration

export GOPATH="${HOME}/src/go"
export PATH="/Users/lbriggs/bin:/Users/lbriggs/scripts:/Users/lbriggs/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/lbriggs/.gem/ruby/2.0.0/bin:/Users/lbriggs/.rvm/bin:/usr/local/go/bin:$GOPATH/bin:/Users/lbriggs/Library/Python/3.6/bin/:/opt/puppetlabs/bin:$HOME/.jenv/bin:$HOME/.poetry/bin"

eval "$(jenv init -)"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DEFAULT_USER="lbriggs"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('dir' 'vcs' 'virtualenv')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('rvm' 'status' 'go_version' 'aws' 'kubecontext')
POWERLEVEL9K_RVM_BACKGROUND="red"
POWERLEVEL9K_RVM_FOREGROUND="black"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=8
POWERLEVEL9K_MODE='compatible'
POWERLEVEL9K_BATTERY_CHARGED="green"
POWERLEVEL9K_BATTERY_CHARGING="yellow"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

AWS_DEFAULT_PROFILE="engineering"

#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

unsetopt correct_all  
setopt correct


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lbriggs/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lbriggs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lbriggs/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lbriggs/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias go=richgo
export PATH="/usr/local/opt/gettext/bin:$PATH"

# added by travis gem
[ -f /Users/lbriggs/.travis/travis.sh ] && source /Users/lbriggs/.travis/travis.sh

#AWSume alias to source the AWSume script
alias awsume=". \$(pyenv which awsume)"
fpath=(/usr/local/share/zsh/site-functions $fpath)
