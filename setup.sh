#!/usr/bin/env bash
set -e
script_dir=$(realpath $(dirname "$0"))
cd $script_dir

backup_dir="$script_dir/backup"
home_dir="$script_dir/test"

paths=$(find . ! -path . | grep -vFf .ignore | sort)


if [ "$1" == "-f" ]; then
    force=true
    echo "Force mode is on! Changes will happen!"
else
    force=false
    echo "Force mode is off. Use flag '-f' to actually make changes"
fi

if [ -d $backup_dir ]; then
    rm -r $backup_dir
fi

if [ ! -d $backup_dir ]; then
    mkdir $backup_dir
fi

top_levels=$(find . -maxdepth 1 ! -path . | grep -vFf .ignore | sort)

for path in $top_levels; do
    if [ "$force" = true ]; then
        if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
            echo "copy $home_dir/$path into $backup_dir/$path"
            cp -r $home_dir/$path $backup_dir/$path
            echo "remove $home_dir/$path"
            rm -r $home_dir/$path
        elif [ -L $home_dir/$path ]; then
            echo "delete broken link at $home_dir/$path"
            rm $home_dir/$path 
        fi
        echo "link $home_dir/$path to $script_dir/$path"
        ln -s $script_dir/$path $home_dir/$path
        
        if [ -f $backup_dir/$path ]; then
            echo "copy -T $backup_dir/$path (file) into $home_dir/$path"
            cp -rT $backup_dir/$path $home_dir/$path

        elif [ -d $backup_dir/$path ] && [ ! -L $backup_dir/$path ]; then
            # The trailing slash at the end of the second arg here is important!
            echo "copy -T $backup_dir/$path (directory) into $home_dir/$path/"
            cp -rT $backup_dir/$path $home_dir/$path/
        fi
    else
        if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
            echo "copy $home_dir/$path into $backup_dir/$path"
            echo "remove $home_dir/$path"
        elif [ -L $home_dir/$path ]; then
            echo "delete broken link at $home_dir/$path"
        fi
        echo "link $home_dir/$path to $script_dir/$path"
        
        if [ -f $backup_dir/$path ]; then
            echo "copy -T $backup_dir/$path (file) into $home_dir/$path"

        elif [ -d $backup_dir/$path ]; then
            # The trailing slash at the end of the second arg here is important!
            echo "copy -T $backup_dir/$path (directory) into $home_dir/$path/"
        fi
    fi
done

