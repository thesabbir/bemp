#!/bin/bash
echo -e "\n"
echo -e "Welcome to BEMP installation script"
echo -e "by sabbir"
echo -e "https://github.com/thesabbir/bemp"
echo -e "==================================\n"

echo -e "Updating Homebrew... Please wait...\n"
brew update

echo -e "\nTapping \"homebrew-php\""
brew tap homebrew/homebrew-php

echo -e "\nTapping \"homebrew/versions\""
brew tap homebrew/versions

echo -e "\nTapping \"homebrew/dupes\""
brew tap homebrew/dupes

echo -e "\nInstalling PHP5.6 (without apache)"
brew install php56 --with-fpm  --with-imap  --without-apache --with-debug

echo -e "\nInstalling php56-mcrypt"
brew install php56-mcrypt

echo -e "\nInstalling mysql...."
brew install mysql --enable-debug

echo -e "\nInstalling nginx...."
brew install nginx

echo -e "\nAdding EMP to System Startup"
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

echo -e "\nStarting EMP now..."
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

echo -e "\n"
nginx -v

echo -e "\n"
mysqld --version

echo -e "\n"
php -v

echo -e "\nDone!"
