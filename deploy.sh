#!/bin/sh

echo "---------- Install tmux ----------"

yum install automake -y
yum install libtool -y
yum install ncurses-devel -y

vimpkg="libevent-2.1.8-stable.tar.gz"
if [ ! -f "$vimpkg" ]; then
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
fi
tar -zxvf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./autogen.sh
./configure
make && make install

cd ..

vimpkg="2.9.tar.gz"
if [ ! -f "$vimpkg" ]; then
wget https://github.com/tmux/tmux/archive/2.9.tar.gz
fi
tar -zxvf 2.9.tar.gz
cd ./tmux-2.9/
./autogen.sh
./configure
make && make install

cd ..

bash_conf=${HOME}"/.bashrc"
sed -i '$a export PATH=/usr/local/bin/:$PATH' ${bash_conf}
source $bash_conf
ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6


#yum -y install tmux
echo "Config tmux"
tmux_conf="/.tmux.conf"
tmux_conf_bak="/tmux.conf"
tmux_conf_path=${HOME}${tmux_conf}
tmux_conf_bak_path=${HOME}${tmux_conf_bak}
#echo ${tmux_conf}
if [ ! -d "$tmux_conf_bak_path" ];
then
touch ${tmux_conf_path}
echo "move tmux.conf"
mv -f ${tmux_conf_bak_path} ${tmux_conf_path}
else
echo '# Tmux Config File'>${tmux_conf_path}
sed -i '$a bind-key k select-pane -U' ${tmux_conf_path}
sed -i '$a\bind-key j select-pane -D' ${tmux_conf_path}
sed -i '$a\bind-key h select-pane -L' ${tmux_conf_path}
sed -i '$a\bind-key l select-pane -R' ${tmux_conf_path}
sed -i '$a\unbind C-o' ${tmux_conf_path}
fi

source $tmux_conf_path

bash_conf=${HOME}"/.bashrc"
sed -i '$a #tmux config' ${bash_conf} 
sed -i '$a export TERM="screen-256color"' ${bash_conf}
sed -i '$a alias tmux="tmux -2"' ${bash_conf} 
source $bash_conf


echo "---------- Install htop ----------"
yum -y install htop
echo "---------- Install Git -----------"
yum -y install git
echo "---------- Install CMake ----------"
yum -y install cmake.x86_64
echo "---------- Install Anaconda ----------"
vimpkg="Anaconda3-2019.10-Linux-x86_64.sh"
if [ ! -f "$vimpkg" ]; then
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
fi
chmod 775 Anaconda3-2019.10-Linux-x86_64.sh
./Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3

bash_conf=${HOME}"/.bashrc"
sed -i '$a #anaconda3 config' ${bash_conf} 
sed -i '$a export PATH=/opt/anaconda3/bin:$PATH' ${bash_conf} 
source $bash_conf


echo "---------- Install VIM8 ----------"
yum remove vim vim-tiny vim-common vim-runtime gvim
yum install ncurses-devel -y
yum install libXt-devel gtk2-devel -y
yum -y install python-devel ruby ruby-devel perl perl-devel perl-ExtUtils-Embed
yum install ctags -y
yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel ctags mercurial python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel

vimpkg="vim-8.1.2197.tar.gz"
if [ ! -f "$vimpkg" ]; then
wget https://codeload.github.com/vim/vim/tar.gz/v8.1.2197 
fi
tar -xvzf vim-8.1.2197.tar.gz
cd vim-8.1.2197/
vimpath="/VIM8.1/"
viminstallpath=${HOME}${vimpath}
echo $viminstallpath
if [ ! -d "$viminstallpath" ]; then
mkdir $viminstallpath 
fi
./configure --with-features=huge --enable-multibyte --enable-luainterp --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-cscope --enable-tclinterp --enable-gui=gtk3 --with-python-config-dir=/usr/lib64/python2.7/config --with-python3-config-dir=/opt/anaconda3/lib/python3.7/config-3.7m-x86_64-linux-gnu --with-x --with-tlib=ncurses --with-compiledby="Lio Niu" --prefix=/root/VIM8.1 && make && make install

bash_conf=${HOME}"/.bashrc"
sed -i '$a #vim8.1 config' ${bash_conf} 
vimconfig='PATH='${viminstallpath}"bin:\$PATH"
sed -i '$a export '${vimconfig} ${bash_conf} 
source $bash_conf

echo "---------- Install Vim Tools ----------"
vimtoolpkg="/bundle.tar.gz"
vimtool_path=${HOME}${vimtoolpkg}
if [ -d "$vimtool_path" ]; then
echo "bundle.tar.gz not exist"
else
tar -zxvf bundle.tar.gz
vimtool_vim_path="/.vim/"
vimtoolspath=${HOME}${vimtool_vim_path}
mkdir $vimtoolspath
mv bundle $vimtoolspath
fi

echo "Config vimrc"
vimrc_bak_path="/vimrc"
vimrcpath="/.vimrc"
vimtools_bak_path=${HOME}${vimrc_bak_path}
vimtools_path=${HOME}${vimrcpath}
if [ ! -d "$vimtools_bak_path" ];
then
touch ${tmux_conf_path}
echo "move vimrc.conf"
mv -f ${vimtools_bak_path} ${vimtools_path}
else
echo "move vimrc.conf"
fi
source $vimtools_path

