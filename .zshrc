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
#autoload -Uz compinit && compinit
## Case insensitive path-completion
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
#zstyle ':completion:*' list-suffixes
#zstyle ':completion:*' expand prefix suffix


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ragu/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ragu/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ragu/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ragu/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

