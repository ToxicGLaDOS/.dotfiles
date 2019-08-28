#!/bin/bash
rm ~/.bashrc
rm ~/.bash_aliases
currentdir=$(pwd);
ln ${currentdir}/.bashrc ~/.bashrc
ln ${currentdir}/.bash_aliases ~/.bash_aliases
echo "$(echo '@hourly' $currentdir'/sync.sh' ; crontab -l)" | crontab -
