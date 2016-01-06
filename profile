export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Gems
export PATH="$HOME/.rbenv/shims:$PATH"
# Node.js
export PATH="/usr/local/share/npm/bin:$PATH"
# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export NODE_PATH="/usr/local/lib/node:$NODE_PATH"

source ~/.secrets

export CC="/usr/bin/gcc"


export EDITOR="subl -w"

# Pass through colour escapes
export LESS=-R

#Shortcuts
alias ls='ls -G'
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias pull='git pull'
alias s.='subl .'
alias start_mysql='mysql.server start'
alias be="bundle exec"
alias migr='bin/rake db:migrate db:test:prepare'
alias gst='git status'
alias gadd='git add .'
alias gcv='git commit -v'
alias cuke='bin/cucumber'
alias r="bin/rails"
alias gyoe='git push heroku master'
alias rtest='ruby -I"lib:test"'

# Custom prompt!
# Source the git completion stuff if it exists:
if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi

shade="\[\033[1;32m\]"
colour="\[\033[0;32m\]"
tint="\[\033[0;36m\]"
grey="\[\033[0;37m\]"
red="\[\033[1;31m\]"
white="\[\033[1;37m\]"
default_colour="\[\033[0m\]"

if [ "$UID" = "0" ]
  then terminus="$red#"
  else terminus="$white\$"
fi

case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
esac

# Don't complain if __git_ps1 doesn't exist!
git_branch_name() {
  if type __git_ps1 >/dev/null 2>&1;
    then echo -n "$(__git_ps1)"
    else echo -n ""
  fi
}

git_branch() {
  local skull="☠"
  local git_branch_colour=""
  local branch=""
  local output=""
  if type -p __git_ps1; then
      branch=$(__git_ps1 '%s')
      if [ -n "$branch" ]; then
          status="$(git status 2> /dev/null)"

          if $(echo $status | grep 'added to commit' &> /dev/null); then
              # If we have modified files but no index (blue)
              git_branch_colour='\[\033[1;34m\]'
          else
              if $(echo $status | grep 'to be committed' &> /dev/null); then
                  # If we have files in index (red)
                  git_branch_colour='\[\033[1;31m\]'
              else
                  # If we are completely clean (green)
                  git_branch_colour='\[\033[1;32m\]'
              fi
          fi

          if $(echo $branch | grep "master" &> /dev/null); then
            output="$red$skull$skull$git_branch_colour(master)$red$skull$skull"
          else
            output="$git_branch_colour($branch)"
          fi
      fi
  fi
  echo $output
}

set_prompt() {
  PS1="${TITLEBAR}\n[$shade\u$grey@$colour\h$grey:$tint\w$grey]$(git_branch)$grey$terminus$default_colour"
}

export PROMPT_COMMAND=set_prompt

eval "$(rbenv init -)"

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
