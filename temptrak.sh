#!/bin/bash
# Script: gbod-temp.sh
# Purpose: Display the ARM CPU and GPU temperature of Raspberry Pi 2/3 & 4
# Author: Vivek Gite <www.cyberciti.biz> under GPL v2.x+
# Amended by Graham O'Dwyer <graham@odwyer.uk> to display ºC symbol correctly and improve data display
# -------------------------------------------------------

# Codes tp set forground Colours
NO='\x1b[30m' # Normal
RE='\x1b[31m' # Red 
GR='\x1b[32m' # Green
YE='\x1b[33m' # Yellow
BL='\x1b[34m' # Blue
MA='\x1b[35m' # Magenta
CY='\x1b[36m' # Cyan
WH='\x1b[37m' # White

# Codes to set the Font attributes. These codes also affect the colour of the lines.
N='\x1b[0m' # Normal
B='\x1b[1m' # Bold
I='\x1b[3m' # Italics
U='\x1b[4m' # Underlined
K='\x1b[5m' # K for Blink  
V='\x1b[7m' # V for Inverted


# Shapes for drawing a bouble line box
DboxTopL="╔"
DboxTopR="╗"
DboxHorz="═══════════════════════════════════════════════════════════" 
DboxHHorz="═════════════════════════════" # Half the horozontal line -1 for either side of a split 
DboxVert="║"
DboxBottomL="╚"
DboxBottomR="╝"

# Shapes for drawing a singe line box
SboxTopL="┌"
SboxTopR="┐"
SboxFHorz="───────────────────────────────────────────────────────────"
SboxHHorz="─────────────────────────────" # Half the horozontal line -1 for either side of a split 
SboxVert="│"
SboxBottomL="└"
SboxBottomR="┘"

SboxBD="┬" # Line break pointing down
SboxBU="┴" # Line break pointing up

SDboxLHorz="╞"
SDboxRHorz="╡"
SDbixDD2S="╤" # line break double going down into single

cpu=$(</sys/class/thermal/thermal_zone0/temp)
AppTitle="           ✸ Raspberry Pi: Temperature Tracker ✸           "


# Draw the Top Box
printf "%s\n" ""
printf "%b\n" "${B} ${YE}"
printf "%s%s%s\n" "${DboxTopL}${DboxHorz}${DboxTopR}"
printf "%s%s%s\n" "${DboxVert}${AppTitle}${DboxVert}"
printf "%s%s%s\n" "${DboxBottomL}${DboxHorz}${DboxBottomR}"

# Draw the Middle Box
printf "%b" "${N}${BL}"
printf "%s%s%s\n" "${SboxTopL}${SboxFHorz}${SboxTopR}"
printf "%s %b%s" "${SboxVert}" "${B}${WH}" "$(date)" # Left side of the Box
printf "%b  %-28s%b%s\n" "${MA}" "Host: $(hostname)" "${N}${BL}" "${SboxVert}" # Right side of the box
printf "%s%s%s%s%s\n" "${SDboxLHorz}${DboxHHorz}${SDbixDD2S}${DboxHHorz}${SDboxRHorz}"

# Draw Bottom two boxes
printf "%s%b %-28s" "${SboxVert}" "${YE}${B}" "CPU" 
printf "%b%s%b %-28s%b%s\n" "${N}${BL}" "${SboxVert}" "${RE}${B}" "GPU" "${N}${BL}" "${SboxVert}"
printf "%s%29s%s%29s%s\n" "${SboxVert}" " " "${SboxVert}" " " "${SboxVert}"
printf "%s%b %-28s %b%s%b %-29s%b%s\n" "${SboxVert}" "${B}${YE}" "Current temp=$((cpu/1000)).0°C" "${N}${BL}" "${SboxVert}" "${B}${RE}" "Current $(vcgencmd measure_temp | sed "s/'/°/")" "${N}${BL}" "${SboxVert}"
printf "%s%s%s%s%s\n" "${SboxBottomL}${SboxHHorz}${SboxBU}${SboxHHorz}${SboxBottomR}"

# About line
printf "%b  %s%b %s%b %s\n\n" "${B}${I}${MA}" "Graham O'Dwyer" "${N}${WH}${B}" "- Nov 2021 -" "${CY}" "Version 0.7: (Genar-Hofoen)"

tput sgr0