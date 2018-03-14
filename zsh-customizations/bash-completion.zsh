# Loads the bash compatible completions
autoload bashcompinit
bashcompinit

for file in $HOME/.zsh/customizations/bash-completions/*; do
  source "$file"
done
