#!/bin/bash

# bash script for installing Rails environment on Ubuntu 12.04 Server
#
# Some sources has been changed to mirrors in China mainland.
#
# To use this script, do this in your shell:
#
# $ curl -L https://raw.github.com/gist/2521307/install-rails-12-04-server.sh | bash

sudo echo ""; echo "Root Privilege Acquired"
echo ""
echo "======================================="
echo "========= Installing Aptitude ========="
echo "======================================="
echo ""
sudo apt-get -y install aptitude
echo ""
echo "======================================="
echo "=========== Installing RVM ============"
echo "======================================="
echo ""
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo ""
echo "======================================="
echo "======= Installing Dependencies ======="
echo "======================================="
echo ""
(rvm requirements)
sudo aptitude -y install build-essential openssl libreadline6 libreadline6-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
echo ""
echo "======================================="
echo "======== Installing Ruby 1.9.3 ========"
echo "======================================="
echo ""
rvm install 1.9.3
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
