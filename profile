# Systemwide stuff
export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin"
# Rust
export PATH="/Users/thomas/.cargo/bin:$PATH"
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
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# QT
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"



export NODE_PATH="/usr/local/lib/node:$NODE_PATH"

export SLINK_DEBUG=true

source ~/.secrets

export CC="/usr/bin/gcc"

# Relatively sensible default colours
# Yoinked from http://leocharre.com/articles/setting-ls_colors-colors-of-directory-listings-in-bash-terminal/
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;91:*.cmd=00;32:*.exe=00;32:*.gz=00;90:*.bz2=00;90:*.bz=00;90:*.tz=00;90:*.rpm=00;90:*.rar=00;90:*.zip=00;90:*.iso=00;90:*.cpio=00;31:*.c=33:*.h=33:*.sh=33:*.t=33:*.pm=33:*.pl=33:*.cgi=33:*.pod=33:*.PL=33:*.js=33:*.php=33:*.off=00;9:*.bak=00;9:*.old=00;9:*.htm=94:*.html=94:*.txt=94:*.text=94:*.css=94:*.avi=96:*.wmv=96:*.mpeg=96:*.mpg=96:*.mov=96:*.AVI=96:*.WMV=96:*.mkv=96:*.jpg=96:*.jpeg=96:*.png=96:*.xcf=96:*.JPG=96:*.gif=96:*.svg=96:*.eps=00;96:*.pdf=00;96:*.PDF=00;96:*.ps=00;96:*.ai=00;91:*.doc=00;91:*.csv=95:*.dsv=95:*.db=95:*.sql=95:*.meta=95:*.xml=95:*.yaml=95:*.yml=95:*.conf=95:"

export EDITOR="subl -w"

# Pass through colour escapes
export LESS=-R

#Shortcuts
alias ls='ls -G'
alias gco='git checkout'
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
alias s='say -v Fiona'

# tiny-care-terminal config stuff

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/code'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# should be ok. It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Brisbane, Australia'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=false

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

# To estimate growth of a file, yoinked from https://unix.stackexchange.com/questions/64657/a-command-line-utility-to-visualize-how-fast-a-file-is-growing
monitorio () {
# show write speed for file or directory
    interval="10"
    target="$1"
    size=$(du -ks "$target" | awk '{print $1}')
    firstrun="1"
    echo ""
    while [ 1 ]; do
        prevsize=$size
        size=$(du -ks "$target" | awk '{print $1}')
        #size=$(ls -l "$1"  | awk '{print $5/1024}')
        kb=$((${size} - ${prevsize}))
        kbmin=$((${kb}* (60/${interval}) ))
        kbhour=$((${kbmin}*60))
        # exit if this is not first loop & file size has not changed
        if [ $firstrun -ne 1 ] && [ $kb -eq 0 ]; then break; fi
        echo -e "\e[1A $target changed ${kb}KB ${kbmin}KB/min ${kbhour}KB/hour size: ${size}KB"
        firstrun=0
        sleep $interval
    done
}


export PROMPT_COMMAND=set_prompt

eval "$(rbenv init -)"

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
