# desativa mensagem de boas-vindas
set -U fish_greeting

# director=y
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function dotfiles
    cd ~/.dotfiles
end

# Abrir arquivos de conf
function fishrc
    nvim ~/.config/fish/config.fish
end


# Ir para as pastas de configuracoes
function cd-fishrc
    cd ~/.config/fish
end

function cd-nvrc
    cd ~/.config/nvim
end


function ll
    ls -la $argv
end

alias t="tmux"


export VISUAL='nvim';
export EDITOR='nvim';
export TERM=xterm-256color

# Node
nvm use latest &

# Starhip
starship init fish | source
