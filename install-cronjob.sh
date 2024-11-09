#!/bin/bash
script_dir="$( dirname "$0" )"

if crontab -l | grep -q start-fortune  ; then
    echo "Nothing to install, seems you already have start-fortune.sh in your crontab"
else
  echo "Installing start-fortune.sh as a @reboot cronjob"
  (
    crontab -l
    echo "@reboot sleep 30 ; $script_dir/start-fortune.sh"
  ) | crontab -
fi
