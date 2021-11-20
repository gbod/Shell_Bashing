#!/bin/bash 

FontNormal='\x1b[30m'
FontRed='\x1b[31m' 
FontGreen='\x1b[32m' # Good for inverted colours
FontYellow='\x1b[33m' # Good for inverted colours
FontBlue='\x1b[34m'
FontMagenta='\x1b[35m'
FontCyan='\x1b[36m' # Good for inverted colours
FontWhite='\x1b[37m' # Good for inverted colours

# Codes to set the Font emphasis. These codes also affect the colour of the lines.
Norm='\x1b[0m' # Normal
Bold='\x1b[1m' # Bold
Ital='\x1b[3m' # Italics
Undr='\x1b[4m' # Underlined
Blnk='\x1b[5m' # K for Blink  
Invt='\x1b[7m' # V for Inverted

clear
Printf "\n"
Printf "\n"
printf "%b\n" "${Bold} ${FontCyan}"
scp temptrak.sh Prime:/home/pi/temptrak.sh
printf "%s%b%-16s\n" "Shell script temptrak.sh updated on device: " "${Invt}" " Prime-Mover"
printf "%b" "${Norm}"
printf "%b\n" "${Bold} ${FontGreen}"
scp temptrak.sh Little:/home/pi/temptrak.sh
printf "%s%b%-16s\n" "Shell script temptrak.sh updated on device: " "${Invt}" " Little-Rascal"
Printf "\n"
Printf "\n"

tput sgr0
