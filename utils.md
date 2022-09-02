# Utilities

* audio-manager = alsamixer
* launcher = dmenu, rofi
* screenshot = flameshot
* status-bar = polybar
* battery = acpi
* network-manager = nmcli
* display-manager = xrandr
* terminal-transparancy = compton
* wallpaper-manager = nitrogen
* fancy-ls = exa
* terminal = alacritty
* image-viewer = fim
* backup = backintime

# Information

Change Brightness:
* /sys/class/backlight/intel_backlight/brightness
* /sys/class/backlight/intel_backlight/max_brightness
* echo $brightness_value | sudo tee /sys/class/backlight/intel_backlight/brightness

Set Keyboard Repeat Delay & Rate:
* xset r rate 180 30
* xset can set other user preferences

