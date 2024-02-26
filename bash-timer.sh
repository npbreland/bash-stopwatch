#!/bin/bash

seconds=0

function print()
{
    if [ $seconds -gt 3600 ]; then
        local hours=$((seconds/3600))
        local minutes=$((seconds/60))
        print "\n$hours hours, $minutes minutes, and $seconds seconds elapsed"
    elif [ $seconds -gt 60 ]; then
        local minutes=$((seconds/60))
        print "\n$minutes minutes and $seconds seconds elapsed"
    else
        printf "\n$seconds seconds elapsed"
    fi
}

function print_and_exit()
{
    print
    exit
}

trap "print_and_exit" SIGINT

while [ true ]
do
    sleep 1
    seconds=$((seconds+1))
    if [ $((seconds % 5)) -eq 0 ]; then
        print
    fi
done