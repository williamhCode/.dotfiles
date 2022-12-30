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

# __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# <<< conda initialize <<<

# plugins/tools ----------------------- #
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf keybinds

# autocomplete
autoload -U compinit && compinit -u

# settings
unsetopt autocd

# prevent duplicate path in tmux
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/Applications/MATLAB_R2021a.app/bin"
    export PATH="$PATH:/Users/williamhou/.dotnet/tools"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="$PATH:/Users/williamhou/.local/scripts"
fi

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# directories
vrc="$HOME/.config/nvim"
zrc="$HOME/.zshrc"
pco="/Users/williamhou/Documents/Coding/Personal-coding"
co="/Users/williamhou/Documents/Coding/"
alias cs="cd /Users/williamhou/Documents/Coding/CS180"
alias v="nvim ."
alias a="tmux attach"

alias ibrew="arch -x86_64 /usr/local/bin/brew"

export TERM="xterm-256color"

# vim
export VISUAL="/opt/homebrew/bin/nvim"
export EDITOR="$VISUAL"
set -o emacs

# ssh
function ssh_alias()
{
    local pu_server="hou169@data.cs.purdue.edu"
    local pu_ssh_password=$(security find-generic-password -a "$USER" -s "pu_ssh_password" -w)
    alias ssh_pu="~/.local/scripts/exp.sh $pu_ssh_password ssh $pu_server"
    alias sftp_pu="~/.local/scripts/exp.sh $pu_ssh_password sftp $pu_server"
}
ssh_alias

# tmux
bindkey -s ^f "~/.local/scripts/tmux-sessionizer.sh\n"
alias tms="~/.local/scripts/tmux-sessionizer.sh \${PWD}"

# local zshrc sourcing
autoload -U add-zsh-hook

load-local-conf() {
  if [[ -f .zshrc && $HOME != $PWD ]]; then
    source .zshrc
  fi
}
load-local-conf

add-zsh-hook chpwd load-local-conf

if [[ -n $TMUX && $(tmux display-message -p '#{window_panes}') -le 1 ]]; then
    neofetch
fi

eval "$(starship init zsh)"

