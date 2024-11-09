#!/bin/bash
set -euo pipefail

script_dir="$( dirname "$0" )"
source "$script_dir/config.sh"

fortune=$( "$script_dir/getfortune.sh" )

# Log the time and what fortune was printed
echo $( date ) -- button pressed
echo "$fortune"

# My receipt printer can print 32 characters on a line.
# Use `fold` to make things fit:
echo "$fortune" | fold -w 32 -s > $PRINTER_DEVICE

# print a few blank lines, to feed some paper through
for n in $( seq $FEED_LINES ) ; do
    echo > $PRINTER_DEVICE
done
