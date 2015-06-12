#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing packages"
echo "####################################################################################################"


echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Adding repositories"
echo "------------------------------------------------"

# >>>>> Programming
# +++ VCS
sudo add-apt-repository ppa:git-core/ppa -y # latest git
sudo add-apt-repository ppa:svn/ppa -y # svn

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y # g++ latest
sudo add-apt-repository ppa:webupd8team/java -y # Java Oracle
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y # best text editor
sudo add-apt-repository ppa:ubuntu-sdk-team/ppa -y # QT sdk
sudo add-apt-repository ppa:zarquon42/meshlab -y # latest meshlab
sudo add-apt-repository ppa:romain-janvier/cloudcompare -y # latest cloudcompare


# >>>>> Multimedia
sudo add-apt-repository ppa:kazam-team/stable-series -y # desktop recording
sudo add-apt-repository ppa:shutter/ppa -y # desktop screenshots
sudo add-apt-repository ppa:videolan/stable-daily -y # latest vlc


# >>>>> OS tools
sudo add-apt-repository ppa:gnome-terminator -y
sudo add-apt-repository ppa:tualatrix/ppa -y # Ubuntu Tweak
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y # graphical ppa management
sudo add-apt-repository ppa:freefilesync/ffs -y # freefilesync
sudo add-apt-repository ppa:webupd8team/nemo -y




echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Updating packages index"
echo "------------------------------------------------"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y



echo "\n\n"
echo "------------------------------------------------"
echo ">>>>> Installing packages"
echo "------------------------------------------------"

# >>>>> Programming

# +++ gcc | g++
sudo apt-get install gcc-4.9 g++-4.9 -y --force-yes
dpkg -l | grep gcc | awk '{print $2}'
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50
sudo update-alternatives --config gcc
sudo update-alternatives --config g++


# latest g++ requires latest gdb
sudo apt-get install libncurses5-dev -y
sudo apt-get install texinfo -y
mkdir -p ~/gdb
cd ~/gdb
wget http://ftp.gnu.org/gnu/gdb/gdb-7.9.tar.gz
tar xfv gdb-7.9.tar.gz
cd gdb-7.9
./configure --prefix=/usr
make
sudo make install
cd ~/
rm -rf ~/gdb



sudo apt-get install cmake cmake-gui -y
sudo apt-get install ccache -y
sudo apt-get install colorgcc -y
sudo apt-get install oracle-java7-installer -y
sudo apt-get install sublime-text-installer -y
sudo apt-get install meshlab -y
sudo apt-get install cloudcompare -y


# +++ VCS
sudo apt-get install git -y
sudo apt-get install subversion -y
sudo apt-get install mercurial -y
sudo apt-get install meld -y


# >>>>> Multimedia
sudo apt-get install ubuntu-restricted-extras -y
sudo apt-get install vlc browser-plugin-vlc -y
sudo apt-get install totem-plugins-extra -y
sudo apt-get install kazam -y
sudo apt-get install shutter -y
sudo apt-get install gimp gimp-data gimp-data-extras gimp-plugin-registry -y


# >>>>> OS tools
sudo apt-get install terminator -y
sudo apt-get install nemo nemo-fileroller -y
sudo apt-get install nemo-compare nemo-media-columns -y
sudo apt-get install ntp -y
sudo /etc/init.d/ntp reload
sudo apt-get install ubuntu-tweak -y
sudo apt-get install indicator-multiload -y
sudo apt-get install indicator-cpufreq -y
sudo apt-get install gparted -y
sudo apt-get install filezilla -y
sudo apt-get install y-ppa-manager -y
sudo apt-get install --no-install-recommends gnome-panel -y # usage: gnome-desktop-item-edit --create-new ~/.local/share/applications/
# sudo apt-get install nvidia-cuda-toolkit -y
sudo apt-get install p7zip p7zip-full p7zip-rar -y
sudo apt-get install freefilesync -y
sudo apt-get install gconf-editor -y
sudo apt-get install dconf-tools -y
sudo apt-get install cpufrequtils -y
sudo apt-get install sysstat -y
sudo apt-get install htop -y
sudo apt-get install iotop -y
sudo apt-get install python-pip -y



echo "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
