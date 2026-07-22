alias ls="eza"
#alias cat="bat --style=plain --paging=never"

alias p="pulumi"
alias pulumy="pulumi"
alias plumy="pulumi"

opencode() {
  local profile="${OPENCODE_PROFILE:-${OC_PROFILE:-}}"

  # No profile: run OpenCode normally.
  if [[ -z "$profile" ]]; then
    command opencode "$@"
    return
  fi

  # Prevent path traversal and accidental malformed profile names.
  case "$profile" in
    *[!A-Za-z0-9_-]*)
      echo "Invalid OPENCODE_PROFILE: $profile" >&2
      return 2
      ;;
  esac

  local config_root="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/profiles"
  local profile_config="$config_root/$profile.jsonc"

  if [[ ! -f "$profile_config" ]]; then
    echo "OpenCode profile not found: $profile_config" >&2
    return 2
  fi

  OPENCODE_CONFIG="$profile_config" command opencode "$@"
}

if [[ "$OSTYPE" == darwin* ]]; then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi
#alias vim="nvim"
#alias kubectx='switch'
