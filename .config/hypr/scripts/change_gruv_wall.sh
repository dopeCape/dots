#!/bin/bash
wall=();
tran=(
    "left " " right " " top " " bottom " " wipe " " grow " " center " " outer "  " wave"
);
select_random() {
    printf "%s\0" "$@" | shuf -z -n1 | tr -d '\0'
}
swww img "/home/tejes/rose2.jpg"  
