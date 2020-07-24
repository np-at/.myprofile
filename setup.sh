#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"

# Setup tmux
if [[ ! -d ~/.tmux ]]; then
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
    ln -s -f "$DIR/.tmux.conf.local" ~/.tmux.conf.local
fi


# setup vundle
if [[ ! -d ~/.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#symlink .vimrc
if [[ ! -h ~/.vimrc ]]; then
    ln -s -f "$DIR/.vimrc" ~/.vimrc
fi


#symlink .alacritty.yml
if [[ ! -h ~/.alacritty.yml ]]; then
    ln -s -f "$DIR/.alacritty.yml" ~/.alacritty.yml
fi

#symlink .zshrc
ln -s -f "$DIR/.zshrc" ~/.zshrc

#install oh-my-zsh if not present
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


