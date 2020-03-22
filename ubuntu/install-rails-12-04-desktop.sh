#!/bin/bash
# adicinor esta lina abaixo no source.list
# deb http://security.ubuntu.com/ubuntu bionic-security main
# bash script for installing Rails environment on Ubuntu 12.04 Desktop
#
# Some sources has been changed to mirrors in China mainland.
#
# To use this script, do this in your shell:
#
# $ curl -L https://raw.github.com/gist/2521307/install-rails-12-04-desktop.sh | bash

clear

sudo echo ""; echo "Root Privilege Acquired"

echo ""
echo "======================================="
echo "========= Installing Aptitude ========="
echo "======================================="
echo ""
sudo apt-get -y install aptitude

echo ""
echo "======================================="
echo "========= Updating Apt Source ========="
echo "======================================="
echo ""
sudo aptitude update

echo ""
echo "======================================="
echo "========= Installing gnupg2 ========="
echo "======================================="
echo ""
sudo apt install gnupg2 -y

echo ""
echo "======================================="
echo "=========== Installing RVM ============"
echo "======================================="
echo ""
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo -e '\n[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm # Load RVM into a shell session *as a function*' >> ~/.bashrc

echo ""
echo "======================================="
echo "======= Installing Dependencies ======="
echo "======================================="
echo ""
rvm requirements
#sudo aptitude -y install vim wget build-essential openssl libreadline6 libreadline6-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
sudo apt-get -y install vim wget build-essential openssl libreadline-dev libreadline-dev git zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses-dev automake libtool bison subversion libssl-dev

# rvm --skip-autoreconf pkg install readline
# rvm pkg install zlib

echo ""
echo "======================================="
echo "======== Installing Ruby 1.9.3 ========"
echo "======================================="
echo ""
sed -ie 's/ftp\.ruby-lang\.org\/pub/ruby\.taobao\.org\/mirrors/' ~/.rvm/config/db
rvm install 1.9.3 # --with-readline-dir=$rvm_path/usr --with-zlib-dir=$rvm_path/usr
rvm use 1.9.3 --default
echo ""
echo "ruby version:"
ruby -v
echo ""
echo "gem version:"
gem -v

echo ""
echo "======================================="
echo "======== Replacing Gem Source ========="
echo "======================================="
echo ""
gem source -r http://rubygems.org/
gem source -r http://ruby.taobao.org
gem source -a http://ruby.taobao.org
echo ""
gem source -l

echo ""
echo "======================================="
echo "======= Install Bundler & Rails ======="
echo "======================================="
echo ""
gem install bundler rails
echo ""
bundle -v
echo ""
rails -v

source ~/.bashrc

echo ""
echo "======================================="
echo "           CONGRATULATIONS!            "
echo "        INSTALLATION COMPLETED!        "
echo ""
echo "If you met some problems during instal-"
echo "lation, please tell me on: "
echo "    https://gist.github.com/2521307"
echo "======================================="
echo ""
