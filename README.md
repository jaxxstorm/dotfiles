# Dotfiles Bootstrap

This repository is the `chezmoi` source for Lee Briggs (`jaxxstorm`).

It is intended to bootstrap a new macOS or Linux machine with a consistent shell and toolchain setup, without committing plaintext secrets.

## What Bootstrap Installs

On first apply, the repo bootstraps the base environment:

- `chezmoi` is installed by the one-line bootstrap command below
- `zsh` is installed automatically on Linux if missing
- Homebrew is installed automatically on macOS if missing
- GnuPG and pinentry are installed with OS-specific packages
- `mise` is installed
- `starship` is installed into `~/.local/bin`
- Oh My Zsh is installed if missing
- tools declared in `~/.config/mise/config.toml` are installed by `mise`
- if `~/.config/fnox/age.txt` is missing, setup prompts for the fnox AGE secret key and writes it locally with `0600` permissions

## Bootstrap A New Linux Box

Run this from `bash`:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply jaxxstorm
```

After `chezmoi` finishes:

```sh
export PATH="$HOME/.local/bin:$PATH"
zsh
```

If you want `zsh` to be your login shell:

```sh
chsh -s "$(command -v zsh)"
```

## Bootstrap A New macOS Box

Run this from the default shell:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply jaxxstorm
```

After `chezmoi` finishes:

```sh
export PATH="$HOME/.local/bin:$PATH"
zsh
```

## Update An Existing Machine

If `chezmoi` is already installed:

```sh
export PATH="$HOME/.local/bin:$PATH"
chezmoi update
```

If `chezmoi` is installed but not on `PATH` yet:

```sh
export PATH="$HOME/.local/bin:$PATH"
~/.local/bin/chezmoi update
```

## Notes

- The first bootstrap is expected to run before your final `zsh` environment exists, so running it from `bash` is normal.
- `run_once_` scripts install core tools one time; `run_onchange_` scripts refresh shell integrations and install `mise` tools when tracked config changes.
- `run_after_ensure-fnox-age-key.sh.tmpl` keeps `~/.config/fnox/age.txt` out of source control and prompts only when the file is missing.
- Non-interactive bootstrap can preseed the secret with `FNOX_AGE_SECRET_KEY`.
- `mise` tool versions are tracked in `dot_config/mise/config.toml`.
- No secrets should ever be committed in plaintext to this repository.
