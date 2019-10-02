#!/bin/sh

echo "---------- Install tmux ----------"
#yum -y install tmux
echo "Config tmux"
tmux_conf="/.tmux.conf"
tmux_conf_path=${HOME}${tmux_conf}
#echo ${tmux_conf}
touch ${tmux_conf_path}
echo '# Tmux Config File'>${tmux_conf_path}
sed -i '$a bind-key k select-pane -U' ${tmux_conf_path}
sed -i '$a\bind-key j select-pane -D' ${tmux_conf_path}
sed -i '$a\bind-key h select-pane -L' ${tmux_conf_path}
sed -i '$a\bind-key l select-pane -R' ${tmux_conf_path}
sed -i '$a\unbind C-o' ${tmux_conf_path}
echo "---------- Install htop ----------"
#yum -y install htop
echo "---------- Install Git -----------"
yum -y install git
echo "---------- Install CMake ----------"
yum -y install cmake.x86_64
echo "---------- Install Anaconda ----------"
./Anaconda3-2018.12-Linux-x86_64.sh -b -p /opt/anaconda3
#echo 'export PATH="~/anaconda2/bin:$PATH"' >> ~/.bashrc
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

vimpkg="v8.1.2104.tar.gz"
if [ ! -f "$vimpkg" ]; then
wget https://github.com/vim/vim/archive/v8.1.2104.tar.gz
fi
tar -xvzf v8.1.2104.tar.gz
cd vim-8.1.2104/
vimpath="/VIM8.1/"
viminstallpath=${HOME}${vimpath}
echo $viminstallpath
if [ ! -d "$viminstallpath" ]; then
mkdir $viminstallpath 
fi
./configure --with-features=huge --enable-multibyte --enable-luainterp --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-cscope --enable-tclinterp --enable-gui=gtk3 --with-python-config-dir=/usr/lib64/python2.7/config --with-python3-config-dir=/opt/anaconda3/lib/python3.7/config-3.7m-x86_64-linux-gnu --with-x --with-tlib=ncurses --with-compiledby="Lio Niu" --prefix=/root/VIM8.1 && make && make install

sed -i '$a #vim8.1 config' ${bash_conf} 
vimconfig='PATH='${viminstallpath}"bin:\$PATH"
sed -i '$a export '${vimconfig} ${bash_conf} 
source $bash_conf
echo "---------- Install Vim Tools ----------"
git clone https://github.com/niumuguang/vimrc.git
# viminstallpath=${HOME}${vimpath}
#./configure --prefix=${viminstallpath} && make && make install
