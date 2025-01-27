#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitoradded HDMI-A-1"   ]]; then
    # do_something
    hyperctl --batch "moveworkspacetomonitor	1 HDMI-A-1 ;moveworkspacetomonitor	2 HDMI-A-1 ; moveworkspacetomonitor	3 HDMI-A-1; moveworkspacetomonitor	4 HDMI-A-1; moveworkspacetomonitor	5 HDMI-A-1" 



    
 fi
}

socat -U - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
