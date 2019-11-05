#!/usr/bin/env bash
set -x
script_dir=$(realpath $(dirname "$0"))
cd $script_dir

home_dir="$HOME/test"

top_levels=$(find . | grep -vFf .ignore)

for top_level in $top_levels; do     
    #if [ -f "$home_dir/$top_level" ]; then
    #    rm $home_dir/$top_level
    #fi
    ln -s $script_dir/$top_level  $home_dir/$top_level/
done

