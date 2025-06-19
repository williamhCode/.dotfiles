# plugins/tools ----------------------- #
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf keybinds
source <(fzf --zsh)

# autocomplete
autoload -Uz compinit
compinit

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

alias vi=nvim
alias a="tmux attach"

# alias python="python3"
# alias pip="pip3"

# vim
export VISUAL="nvim"
export EDITOR="$VISUAL"
set -o emacs

# ssh
function ssh_data()
{
    export TERM="xterm-256color"
    ssh hou169@data.cs.purdue.edu
}

function ssh_scholar()
{
    export TERM="xterm-256color"
    ssh hou169@scholar.rcac.purdue.edu
}

function sftp_data()
{
    export TERM="xterm-256color"
    sftp hou169@data.cs.purdue.edu
}

# function ebti_ssh() {
#     export TERM="xterm-256color"
#     ssh -L 7060:localhost:7060 \
#         -L 8081:localhost:8081 \
#         william@10.10.254.11
# }

function ssh_xinu() {
    export TERM="xterm-256color"
    ssh hou169@xinu16.cs.purdue.edu
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
    else
        # If no local .zshrc, check the parent directory
        parent_dir=$(dirname "$PWD")
        if [[ -f "$parent_dir/.zshrc" && $parent_dir != $HOME ]]; then
            if [[ -z $NVIM ]]; then
                current_dir="$PWD"
                cd "$parent_dir"
                source "$parent_dir/.zshrc"
                cd "$current_dir"
            fi
        fi
    fi
}
load-local-conf
add-zsh-hook chpwd load-local-conf

# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# macos stuff --------------------------------------
if [[ "$HOST" == "Williams-MacBook-Pro-4.local" ]]; then

export PYENV_ROOT="$HOME/.pyenv"

# prevent duplicate path
if [[ -z $PATH_SET ]]; then
    export PATH_SET=1
    export PATH="$PATH:/Applications/MATLAB_R2021a.app/bin"
    export PATH="$PATH:/Users/williamhou/.dotnet/tools"
    export PATH="$PATH:/Users/williamhou/.local/scripts"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    # export PATH="/Users/williamhou/Documents/Coding/Github/depot_tools:$PATH"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
    # export PATH="/Users/williamhou/Documents/Coding/nvim-related/neovim/build/bin:$PATH"

    export PATH="/Users/williamhou/mylibraries/nvim-macos-arm64/bin:$PATH"
    export PATH="/Users/williamhou/mylibraries/zig:$PATH"
fi

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" 

# directories
pco="/Users/williamhou/Documents/Coding/Personal-coding"
co="/Users/williamhou/Documents/Coding/"

alias neogui="/Users/williamhou/Documents/Coding/Personal-coding/neogui/build/release/neogui"

fi
