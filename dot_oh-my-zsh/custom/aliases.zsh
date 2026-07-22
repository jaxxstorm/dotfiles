alias ls="eza"
#alias cat="bat --style=plain --paging=never"

alias p="pulumi"
alias pulumy="pulumi"
alias plumy="pulumi"

opencode-profile() {
  if [[ $# -ne 1 || ! "$1" =~ ^[A-Za-z0-9_-]+$ ]]; then
    print -u2 "usage: opencode-profile <name>"
    return 2
  fi

  local profile="$HOME/.config/opencode/profiles/$1.json"
  if [[ ! -f "$profile" ]]; then
    print -u2 "OpenCode profile not found: $profile"
    return 1
  fi

  OPENCODE_CONFIG="$profile" command opencode
}

alias ocp="opencode-profile"

if [[ "$OSTYPE" == darwin* ]]; then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi
#alias vim="nvim"
#alias kubectx='switch'
