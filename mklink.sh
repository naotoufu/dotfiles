#!/bin/sh
#ln -sf ~/dotfiles/bashrc	~/.bashrc
#ln -sf ~/dotfiles/bashrc.mine	~/.bashrc.mine
#ln -sf ~/dotfiles/bash_profile	~/.bash_profile
ln -sf ~/dotfiles/screenrc	~/.screenrc
ln -sf ~/dotfiles/screenrc.local	~/.screenrc.local
ln -sf ~/dotfiles/screen	~/.screen
ln -sf ~/dotfiles/tmux.conf	~/.tmux.conf
#ln -sf ~/dotfiles/xinitrc	~/.xinitrc
ln -sf ~/dotfiles/vimrc	~/.vimrc
#ln -sf ~/dotfiles/vim	~/.vim
git clone https://github.com/yanaoto/bin.git ~/bin

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
ln -sf ~/dotfiles/emacs.d      ~/.emacs.d
ln -sf ~/dotfiles/zsh	~/.zsh
ln -sf ~/dotfiles/zshrc	~/.zshrc
ln -sf ~/dotfiles/zshrc.mine	~/.zshrc.mine
ln -sf ~/dotfiles/zshenv	~/.zshenv
ln -sf ~/dotfiles/zshrc_alias	~/.zshrc_alias
sudo yum -y install zsh
sudo chsh -s `which zsh`
exec zsh -l
