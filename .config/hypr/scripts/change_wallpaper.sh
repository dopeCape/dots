#!/bin/bash
# wall=();
# tran=(
#     "left " " right " " top " " bottom " " wipe " " grow " " center " " outer "  " wave"
# );
#
# select_random() {
#     printf "%s\0" "$@" | shuf -z -n1 | tr -d '\0'
# }
# search_dir=/home/tejes/swww_images
# for entry in "$search_dir"/*
# do
#     wall+=($entry)                  # Also Push
#
# done
#
# x=$(select_random "${wall[@]}")
# y=$(select_random "${tran[@]}")
# echo "$x"

swww img /home/baby/Downloads/rose_pine_contourline.png  --transition-bezier .13,0.19,1,.1 \
    --transition-type outer \
    --transition-duration 1 \
    --transition-fps 144 \
    --transition-pos  center
