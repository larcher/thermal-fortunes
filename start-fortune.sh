#!/bin/bash

script_dir="$( dirname "$0" )"
"$script_dir"/button_watch.sh > "$script_dir"/button-watch.log 2>&1 &
