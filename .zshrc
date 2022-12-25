## Convenience Aliasing
alias ls='ls -lFh'


## Export Paths
# Requires NVM (Node Version Manager): `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash`
# To install node after NVM, use `nvm install --lts`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## Make Terminal Tabs reflect current working directory
# Make sure to set turn off all Termianl Preferences->Profile->Window->Title Options
precmd () { print -Pn "\e]0;%~\a" } # title bar prompt


## Prompt coloring for Git
function parse_git_branch() {
    # Old way from bash
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

# Print all colors: 'for i in {1..256}; do print -P "%F{$i}Color : $i"; done;'
# Select desired color values and insert into format string below
setopt PROMPT_SUBST
export PROMPT='%F{118}%n%f@%F{118}${${(%):-%m}#zoltan-}%f %F{cyan}%~%f %F{190}$(parse_git_branch)%f %F{normal}$ %f'


## Path Completion 
# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and/1092328
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
autoload -Uz compinit && compinit
## Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

export PATH="/opt/homebrew/bin/git-lfs:/opt/homebrew/bin/:/opt/homebrew/opt/python@3.8/bin:$PATH"
