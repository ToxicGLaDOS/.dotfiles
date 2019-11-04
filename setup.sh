#!/usr/bin/env bash
set -x
script_dir=$(dirname "$0")
cd $script_dir

home_dir="$HOME/test"

top_levels=$(ls -A)

for top_level in $top_levels; do
    ln -s $script_dir/$top_level  $home_dir/$top_level
done

