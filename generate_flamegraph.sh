#!/bin/bash

set -x

local_directory="$1"

if [[ -z $FLAMEGRAPH_DIR ]]; then
    echo "you have to define FLAMEGRAPH_DIR";
    exit 1
fi

# generate graph
for file in $local_directory/*
do
    if [[ $file =~ .*\.stack ]]; then
        echo $file
        $FLAMEGRAPH_DIR/stackcollapse-perf.pl $PERF_COLLAPSE_OPTS $file | tee $file.collapsed | $FLAMEGRAPH_DIR/flamegraph.pl --color=java > $file.svg
    fi
done
