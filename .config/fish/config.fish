set EDITOR vim
set PATH ~/.emacs.d/bin $PATH

alias iex='iex --erl "-kernel shell_history enabled"'

starship init fish | source
