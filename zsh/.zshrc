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

# fzf keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fpath+=~/.zfunc

# autocomplete
autoload -Uz compinit && compinit

# settings
unsetopt autocd
setopt hist_ignore_all_dups

# add color to ls
export CLICOLOR=1

# increase history size
export HISTSIZE=20000
export SAVEHIST=20000

# prevent duplicate path in tmux
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/Applications/MATLAB_R2021a.app/bin"
    export PATH="$PATH:/Users/williamhou/.dotnet/tools"
    export PATH="$PATH:/Users/williamhou/.local/scripts"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

# directories
# vrc="$HOME/.config/nvim"
# zrc="$HOME/.zshrc"
pco="/Users/williamhou/Documents/Coding/Personal-coding"
co="/Users/williamhou/Documents/Coding/"
alias vi="env TERM=wezterm nvim"
alias a="tmux attach"

alias python="python3"
alias pip="pip3"

# vim
export VISUAL="/opt/homebrew/bin/nvim"
export EDITOR="$VISUAL"
set -o emacs

# ssh
function ssh_alias()
{
    local pu_server="hou169@data.cs.purdue.edu"
    # local pu_ssh_password=$(security find-generic-password -a "$USER" -s "pu_ssh_password" -w)",push"
    # alias pu_ssh="~/.local/scripts/exp.sh $pu_ssh_password ssh $pu_server"
    # alias pu_sftp="~/.local/scripts/exp.sh $pu_ssh_password sftp $pu_server"
    alias pu_ssh="ssh $pu_server"
    alias pu_sftp="sftp $pu_server"
}
ssh_alias

# # tmux
alias f="~/.local/scripts/tmux-sessionizer.sh"
function tms() {
    if [[ -n $1 ]] then
        ~/.local/scripts/tmux-sessionizer.sh $1
    else
        ~/.local/scripts/tmux-sessionizer.sh ${PWD}
    fi
}

# # local zshrc sourcing
autoload -U add-zsh-hook

load-local-conf() {
if [[ -f .zshrc && $HOME != $PWD ]]; then
    source .zshrc
fi
}
load-local-conf

add-zsh-hook chpwd load-local-conf

# if [[ -n $TMUX && $(tmux display-message -p '#{window_panes}') -le 1 && -z $VIMRUNTIME ]]; then
#   neofetch
# fi

# personal config
# setopt PROMPT_SUBST

# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# export PROMPT='%B%F{cyan}%~%f%F{magenta}$(parse_git_branch) %f%b%F{green}❯%f '

eval "$(starship init zsh)"
