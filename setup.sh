#!/bin/bash
if [ -d $HOME/.vim/bundle/vundle ]; then
	rm -rf $HOME/.vim/bundle/vundle
	if [ $? -eq 0 ]; then
		 echo "$HOME/.vim/bundle/vundle clear!"
	fi
fi


git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle
if [ $? -eq 0 ]; then
	 echo "install vundle successfully!"
fi

cp -r colors $HOME/.vim
if [ $? -eq 0 ]; then
	 echo "copy colorsolarized successfully!"
fi

cp .vimrc $HOME
if [ $? -eq 0 ]; then
	 echo "copy .vimrc successfully!"
fi

vim +PluginInstall +qall
if [ $? -eq 0 ]; then
	 echo "install plugin successfully!"
fi

sed -i "s/filetype off/filetype on/g" $HOME/.vimrc
if [ $? -eq 0 ]; then
	 echo "filetype on!"
fi

echo "Done!"
