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

export PYENV_ROOT="$HOME/.pyenv"

# prevent duplicate execution in tmux
if [[ -z $TMUX ]]; then
    export PATH="$PATH:/Applications/MATLAB_R2021a.app/bin"
    export PATH="$PATH:/Users/williamhou/.dotnet/tools"
    export PATH="$PATH:/Users/williamhou/.local/scripts"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    # export PATH="$PATH:/Users/williamhou/mylibraries/zig"
    export PATH="/Users/williamhou/mylibraries/zig:$PATH"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    export PATH="/Users/williamhou/Downloads/nvim-macos/bin:$PATH"
fi

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

# directories
pco="/Users/williamhou/Documents/Coding/Personal-coding"
co="/Users/williamhou/Documents/Coding/"
# alias vi="env TERM=wezterm nvim"
alias vi=nvim
alias a="tmux attach"

# alias python="python3"
# alias pip="pip3"

alias neogui="/Users/williamhou/Documents/Coding/Personal-coding/neogui/build/release/neogui"

# vim
export VISUAL="/opt/homebrew/bin/nvim"
export EDITOR="$VISUAL"
set -o emacs

# ssh
function ssh_alias()
{
    local pu_server="hou169@data.cs.purdue.edu"
    alias pu_ssh="ssh $pu_server"
    alias pu_sftp="sftp $pu_server"
}
ssh_alias

# tmux
alias f="~/.local/scripts/tmux-sessionizer.sh"
function tms() {
    if [[ -n $1 ]] then
        ~/.local/scripts/tmux-sessionizer.sh $1
    else
        ~/.local/scripts/tmux-sessionizer.sh ${PWD}
    fi
}

eval "$(starship init zsh)"

# local zshrc sourcing
autoload -U add-zsh-hook
load-local-conf() {
if [[ -f .zshrc && $HOME != $PWD ]]; then
    # don't source if in nvim terminal
    if [[ -z $NVIM ]]; then
        source .zshrc
    fi
fi
}
load-local-conf
add-zsh-hook chpwd load-local-conf

# if [[ -n $TMUX && $(tmux display-message -p '#{window_panes}') -le 1 && -z $VIMRUNTIME ]]; then
#   neofetch
# fi

