#!/bin/bash

script_dir="$( dirname "$0" )"
set -x
source "$script_dir/config.sh"
set +x

# Configure the printer serial device and GPIO pin
/bin/stty -F $PRINTER_DEVICE 19200
gpio mode $BUTTON_PIN in

last_press=0
while true ; do
    # wait for a button press ...
    gpio -g wfi $BUTTON_PIN rising
    now=$( date +%s )
    # reload config, in case you want to change the interval or other settings
    # without restarting this script
    source "$script_dir/config.sh"
    # make sure no one presses the button too quickly   ಠ_ಠ
    if [ $(( now - last_press )) -gt $MIN_INTERVAL_FOR_PRESSES ] ; then
        "$script_dir/printfortune.sh"
        last_press=$now
    else
	echo `date` - button press ignored, only $(( now - last_press )) seconds since last press
    fi
done
