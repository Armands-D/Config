#!/usr/bin/env bash

# User arg1, % brightness range(1, 100)
user_brightness=$1
# File stores max brightness value
max_brightness=`cat /sys/class/backlight/intel_backlight/max_brightness`

# Check user arg1 is within range(1, 100)
if [ $user_brightness -gt 0 ] && [ $user_brightness -lt 101 ]
then
  # dependancy: bc
  # bash calculator evaluates expressions with decimal values
  # printf rounds / removes trailing decimals
  new_brightness=`printf "%0.f" $(echo "$max_brightness * ($user_brightness / 100)" | bc -l)`
  echo $new_brightness | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
  printf "Brightness: %d%%,\n" $1
  # Check if acpi is installed to show battery status
  if [ $(which acpi) ]
  then
    acpi
  fi
else
  echo "Brightness must be a whole number between (1, 100) inclusive."
fi

