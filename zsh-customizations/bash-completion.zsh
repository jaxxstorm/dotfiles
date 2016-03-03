# Loads the bash compatible completions
autoload bashcompinit
bashcompinit

for file in $ZSH/customizations/bash-completions/*; do
  source "$file"
done
