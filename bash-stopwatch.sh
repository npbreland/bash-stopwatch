#!/bin/bash

seconds=0

function elapsed_text()
{
    if [ $seconds -gt 3600 ]; then
        local hours=$((seconds / 3600))
        local minutes=$((seconds / 60))
        local minutes_beyond=$((minutes % 60))
        local seconds_beyond=$((seconds % 60))
        echo "\n$hours hours, $minutes_beyond minutes, and $seconds_beyond seconds elapsed"
    elif [ $seconds -gt 60 ]; then
        local minutes=$((seconds / 60))
        local seconds_beyond=$((seconds % 60))
        echo "\n$minutes minutes and $seconds_beyond seconds elapsed"
    else
        echo "\n$seconds seconds elapsed"
    fi
}

function print_and_exit()
{
    printf "$(elapsed_text)" >&2 
    echo $seconds
    exit
}

trap "print_and_exit" SIGINT

while [ true ]
do
    sleep 1
    seconds=$((seconds + 1))
    if [ $((seconds % 5)) -eq 0 ]; then
        printf "$(elapsed_text)"  >&2 
    fi
done
