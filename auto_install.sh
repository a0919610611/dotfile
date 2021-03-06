#!/bin/sh -x
OS=$(uname -s)
echo "OS is $OS"
echo "start dotfile install"
git submodule init
git submodule update --recursive
here=$PWD
echo "the dotfile location is $here"
cat /etc/shells | grep -q "zsh"
have_zsh=$?


mkdir $HOME/bin
cp -rn $here/common/bin $HOME/bin


echo "install YouCompletme? (y/n) default is y"
read answer
install_youcompletme=1
if echo "${answer:=y}"|grep -iq '^y' ;then
    install_youcompletme=1
else
    install_youcompletme=0
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ];then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) && exit"
fi

ln -fs $here/common/zsh-common.zsh $HOME
ln -fs $here/common/.editorconfig $HOME


# Darwin is MacOS
if [ $OS = "Darwin" ] ;then
    ln -fs $here/mac/.zshenv $HOME
    ln -fs $here/mac/.ycm_extra_conf.py $HOME
elif [ $OS = "Linux" ] ;then
    if [ $have_zsh -ne 0 ];then
        sudo apt-get install zsh
    fi
    ln -fs $here/ubuntu/.zshrc $HOME
elif [ $OS = "FreeBSD" ] ;then
    ln -fs $here/freebsd/.zshrc $HOME
fi
# My Custom theme
ln -fs $here/common/fuyu0425.zsh-theme $HOME/.oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time

echo "common settings start"
echo "tmux setting"
ln -fs $here/common/.tmux.conf $HOME
echo "vim setting"
ln -fs $here/common/.vim $HOME
ln -fs $here/common/.vimrc $HOME

if [ $install_youcompletme -eq 0 ];then
    sed -i -e s@"Bundle 'Valloric/YouCompleteMe'"@"\"Bundle 'Valloric/YouCompleteMe'"@g $HOME/.vimrc
fi

vim +PluginInstall +qall
if [ $install_youcompletme -ne 0 ];then
    cd $HOME/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
fi
echo "complete"

# git config
git config --global credential.helper cache
