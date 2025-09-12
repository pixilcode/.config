#!/bin/bash

# add the following line to your .bashrc
#     source "${HOME}/.config/profile"

# append a list of paths to the PATH variable
while IFS= read -r line
do
    new_path="${line//HOME/${HOME}}"
    PATH="${PATH}:${new_path}"
done < "${HOME}/.config/path"

# setup zoxide
eval "$(zoxide init bash)"

# setup opam
test -r /home/brendonbown/.opam/opam-init/init.sh && . /home/brendonbown/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# aliases
alias grep=rg
alias find=fdfind
alias cd=z
alias v=nvim
alias cat=bat

