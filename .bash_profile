alias ls='ls -lFh'

# Case insensitive tab completion
bind "set completion-ignore-case on"

# This makes it unnecessary to press Tab twice when there is more than one match
bind "set show-all-if-ambiguous on"

## Make Terminal Tabs reflect current working directory
function tab_title {
  DIR_NAME=${PWD##*/}
  echo -ne "\033]0;${DIR_NAME}\007\c"
}
PROMPT_COMMAND="tab_title ; $PROMPT_COMMAND"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

## Git branch in prompt.
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set the prompt to show current working directory and git branch name, if it exists
export PS1="\[$GREEN\]\u\[$BLUE\]@\[$CYAN\]\h \[$POWDER_BLUE\]\W\[$LIME_YELLOW\]\$(parse_git_branch)\[\033[00m\] \[$NORMAL\]\$ "

# Ruby environment
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Virtual Environments -- Python 3
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export WORKON_HOME=~/.virtualenvs
#export PROJECT_HOME=~/Projects
#source /usr/local/bin/virtualenvwrapper.sh
#source /usr/local/opt/autoenv/activate.sh

# Pyenv setup
eval "$(pyenv init -)"
