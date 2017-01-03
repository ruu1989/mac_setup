ssh-add
fortune -s | cowsay

# Fire up bash prompt if it exists, if not prompt me to install it.
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
else
  echo 'brew install bash-git-prompt'
fi

# History save-a-tron.
mkdir -p ~/.history  # Always create history dir if it doesn't exist.
prompt() {

  # Store all commands in a file
  echo "$(date "+%Y-%m-%d.%H:%M:%S") $HOSTNAME $(history 1)" >> ~/.history/all
  echo "$(date "+%Y-%m-%d.%H:%M:%S") $HOSTNAME $(history 1)" >> ~/.history/$(date "+%Y-%m-%d")
}
export PROMPT_COMMAND=prompt

history_search() {
  grep "$@" ~/.history/all
}
alias h=history_search

# Other Aliases
alias fucking='sudo'
alias be='bundle exec'

# Fire up a venv
alias venv_install="virtualenv --setuptools --no-site-packages --prompt=\"(${PWD##*/}) \" .virtualenv && source .virtualenv/bin/activate && pip install --upgrade pip && pip install --upgrade setuptools --no-use-wheel && if [ -a requirements.txt ]; then pip install --upgrade --requirement requirements.txt; fi"
