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

if [ ! -d $backup_dir ]; then
    mkdir $backup_dir
fi
find $backup_dir -mindepth 1 -delete

#for path in $paths; do
#    if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
#        DIFF=$(diff -rq $home_dir/$path $script_dir/$path)
#
#        # If they're different
#        if [ "$DIFF" != "" ]; then
#            # Then just copy the file to the right directory in the backup dir
#            if [ -f $home_dir/$path ]; then
#                cp $home_dir/$path $backup_dir/$path
#                                 
#            # Then make a mirror directory in the backup
#            elif [ -d $home_dir/$path ]; then
#                mkdir $backup_dir/$path
#            fi
#        fi
#    fi
#done

top_levels=$(find . -maxdepth 1 ! -path . | grep -vFf .ignore | sort)

for path in $top_levels; do
    if [ "$force" = true ]; then
        if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
            echo "copy $home_dir/$path into $backup_dir/$path"
            cp -r $home_dir/$path $backup_dir/$path
            echo "remove $home_dir/$path"
            rm -r $home_dir/$path
        fi
        echo "link $home_dir/$path to $script_dir/$path"
        ln -s $script_dir/$path $home_dir/$path
        
        if [ -f $backup_dir/$path ] || [ -d $backup_dir/$path ]; then

            echo "copy -T $backup_dir/$path into $home_dir/$path"
            cp -rT $backup_dir/$path $home_dir/$path
        fi
    else
        if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
            echo "copy $home_dir/$path into $backup_dir/$path"
            echo "remove $home_dir/$path"
        fi
        echo "link $home_dir/$path to $script_dir/$path"

        if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
            echo "copy -rT $backup_dir/$path into $home_dir/$path"
        fi

    fi
done

