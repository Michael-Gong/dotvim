#!/bin/bash -e
# File: install.sh
# Date: Fri Jul 28 11:47:32 2017 -0700
# Author: Yuxin Wu <ppwwyyxxc@gmail.com>
echo "Backup original vimfiles to ~/backup_vim* ..."
[[ -f ~/.vimrc ]] && mv -v ~/.vimrc ~/backup_vimrc
[[ -d ~/.vim ]] && mv ~/.vim ~/backup_vim

LINE="---------------------------------------------------------------------"

echo "Copying files..."
cp vimrc ~/.vimrc
rm ~/.vim -rvf && cp vim ~/.vim -rvf

echo "Generating dict..."
cd ~/.vim/static/
python dict_to_cases.py

mkdir -p ~/.vimtmp/undo
mkdir -p ~/.vimtmp/vim-fuf-data
mkdir -p ~/.config/
ln -sv ~/.vim ~/.config/nvim
cd ~/.config/nvim
ln -sv ~/.vimrc ./init.vim
cd -

vim +PlugInstall +qall

#echo "Patching..."
#for i in ~/.vim/patch/*; do
   #filename=`basename $i`
   #bundle="${filename%.*}"
   #echo "Patching $bundle ..."
   #cd ~/.vim/bundle/$bundle
   #patch -p0 < $i
#done

echo "Finish installing ppwwyyxx/dotvim"
