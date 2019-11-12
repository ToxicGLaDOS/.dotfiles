#!/usr/bin/env bash
script_dir=$(realpath $(dirname "$0"))
cd $script_dir

backup_dir="$script_dir/backup"
home_dir="$script_dir/test"

paths=$(find . ! -path . | grep -vFf .ignore | sort)


if [ "$1" == "-f" ]; then
    force=true
else
    force=false
fi

if [ ! -d $backup_dir ]; then
    mkdir $backup_dir
fi
echo $(find $backup_dir -mindepth 1)

for path in $paths; do
    if [ -f $home_dir/$path ] || [ -d $home_dir/$path ]; then
        DIFF=$(diff -rq $home_dir/$path $script_dir/$path)

        # If they're different
        if [ "$DIFF" != "" ]; then
            # Then just copy the file to the right directory in the backup dir
            if [ -f $home_dir/$path ]; then
                cp $home_dir/$path $backup_dir/$path
                if [ "$force" = true ]; then
                    echo "BLAH"
                else
                    echo "would remove $home_dir/$path"
                fi
                 
            # Then make a mirror directory in the backup
            elif [ -d $home_dir/$path ]; then
                mkdir $backup_dir/$path
            fi
        fi
    fi
done





#for file in $files; do
#    if [ -f "$home_dir/$file" ] || [ -d "$home_dir/$file" ]; then
#        rm -r $home_dir/$file
#    fi
#    ln -s $script_dir/$file  $home_dir/$file
#done

