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
# setopt inc_append_history
setopt share_history

# add color to ls
export CLICOLOR=1

# increase history size
export HISTSIZE=20000
export SAVEHIST=20000

export PYENV_ROOT="$HOME/.pyenv"

# prevent duplicate execution in tmux
if [[ -z $TMUX ]]; then
    # clear PATH first to default
    export PATH="$PATH:/Applications/MATLAB_R2021a.app/bin"
    export PATH="$PATH:/Users/williamhou/.dotnet/tools"
    export PATH="$PATH:/Users/williamhou/.local/scripts"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export PATH="/Users/williamhou/mylibraries/zig:$PATH"
    # export PATH="/Users/williamhou/Documents/Coding/Github/depot_tools:$PATH"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # export PATH="/Users/williamhou/mylibraries/nvim/bin:$PATH"
    export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

    # export PATH="/Users/williamhou/Documents/Coding/nvim-related/neovim/build/bin:$PATH"
fi

echo "PATH when $(basename $SHELL) starts: $PATH" >> ~/path_debug.txt

# export CC="/opt/homebrew/opt/llvm/bin/clang"
# export CXX="/opt/homebrew/opt/llvm/bin/clang++"

# fix https://github.com/llvm/llvm-project/issues/77653
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

# directories
pco="/Users/williamhou/Documents/Coding/Personal-coding"
co="/Users/williamhou/Documents/Coding/"
# alias vi="env TERM=xterm-kitty nvim"
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

function ebti_ssh() {
    export TERM="xterm-256color"
    ssh -L 7060:localhost:7060 \
        -L 8081:localhost:8081 \
        william@10.10.254.11
}

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

# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
