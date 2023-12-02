## Convenience Aliasing
alias ls='ls -lFh'
alias yt-dlp='yt-dlp --all-subs -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

## Custom PATH changes
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Use awscli v1 for AWS Snow Family Devices (max supported is v1.16.14)
# brew install awscli@1
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"

# Created by `pipx` on 2023-10-24 20:16:23
export PATH="$PATH:/Users/ragu/.local/bin"
