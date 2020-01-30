#/usr/bin/env bash


num_cpus=$(grep siblings  /proc/cpuinfo | head -n 1 | awk '{print $3}')

uptime | awk '{usage=$8*100} END {print "CPU Usage: "usage/'$num_cpus'"%"}'
