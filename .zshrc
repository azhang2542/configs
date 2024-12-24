# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrewzhang/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrewzhang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andrewzhang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andrewzhang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
autoload -Uz compinit && compinit

# alias for nvim
alias vim=nvim

# alias for bat
alias cat=bat

# better vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# have color mode be default for ls
alias ls='ls --color=auto'

# autosuggestion
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting NEEDS TO BE AT THE BOTTOM
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
