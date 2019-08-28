#!/usr/bin/env bash


lines=$(grep -E 'MemTotal:|MemFree:' /proc/meminfo | awk '{print $2}')

lines=(${lines[@]})
total=${lines[0]}
free=${lines[1]}

percent=$(bc <<< "scale=2;($total-$free)/$total*100")
echo "Memory usage: "$percent"%"


