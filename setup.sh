#!/usr/bin/env bash
set -x
script_dir=$(realpath $(dirname "$0"))
cd $script_dir

home_dir="$script_dir/test"

files=$(find . ! -path . | grep -vFf .ignore)

for file in $files; do
    if [ -f "$home_dir/$file" ] || [ -d "$home_dir/$file" ]; then
        rm -r $home_dir/$file
    fi
    ln -s $script_dir/$file  $home_dir/$file
done

