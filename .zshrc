## Convenience aliasing
alias ls='ls -lFh'


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