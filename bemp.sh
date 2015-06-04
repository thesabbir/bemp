#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo -e "\n"
echo -e "Welcome to BEMP installation script"
echo -e "by sabbir"
echo -e "https://github.com/thesabbir/bemp"
echo -e "==================================\n"

echo -e "\nChecking requirements...\n"

 if hash brew 2>/dev/null
 then
    echo -e "${green}√ homebrew installed\n${reset}"
 else
 	echo "${red}Homebrew is required!${reset}"
 	echo "Please install homebrew form http://brew.sh"
 	exit 1
 fi

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

echo -e "\n${green}Nginx installed${reset}"
nginx -v

echo -e "\n${green}Mysql installed${reset}"
mysqld --version

echo -e "\n${green}PHP installed${reset}"
php -v

echo -e "\n${red}Please run \"mysql_secure_installation\" to secure your mysql installation${reset}"
echo -e "\n${green}Installation Done!${reset}"

echo -e "Do you want to configure nginx with php-fpm ?"
echo -e "${red}root access required & overwrites your existing nginx configurations!${reset}"

read -p "Press y to continue [y/n]" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cd nginx
	./nginx.sh
fi