#!/bin/bash

set -x

username="$1"

NODES=`cat slaves`

# add permission for yarn to run perf
for slave_ip in `echo $NODES|sed  "s/#.*$//;/^$/d"`; do
    echo $slave_ip
    ssh $username@$slave_ip "sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`"
    ssh $username@$slave_ip "sudo apt-get install openjdk-8-dbg"
done

