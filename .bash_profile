# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Control the size of the history file
HISTFILESIZE=32768
HISTSIZE=32768
# Ignore duplicate commands and commands starting with a space
HISTCONTROL=ignoreboth

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Load the shell dotfiles, and then some:
for file in ~/.{alias,git,ls,npm,py}.bash; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
