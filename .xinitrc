#!/bin/sh

##----------------------------------------------------------------------------##
## Update Xresources
##----------------------------------------------------------------------------##

[[ -f ~/.Xresources ]] && xrdb -merge -I "$HOME" ~/.Xresources

##----------------------------------------------------------------------------##
## My fonts
##----------------------------------------------------------------------------##

xset +fp ~/.local/share/fonts
xset fp+ /usr/share/fonts/TTF
xset fp+ /usr/share/fonts/OTF
xset fp+ /usr/share/fonts/artwiz-fonts
xset fp+ /usr/share/fonts/local
xset fp+ /usr/share/fonts/misc
xset fp rehash

##----------------------------------------------------------------------------##
## General settings
##----------------------------------------------------------------------------##

intern=LVDS-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi


#xrandr --output HDMI-1 --mode 1360x768

#x cursor
xsetroot -cursor_name left_ptr&

#typematic delay/ rate
xset r rate 200 20

#Change blank time to 1 hour
xset s 3600 3600

#no bell
xset b off

# set monitor to sleep
xset s 600 600

##----------------------------------------------------------------------------------------------------------------------##
## Autostart programs + scripts
##----------------------------------------------------------------------------------------------------------------------##
#(sleep 2s && dunst) &
##[ ! -s ~/.config/mpd/pid ] && mpd
#mopidy &
udiskie &
compton --config ~/.config/compton.conf -b &> /tmp/compton.log
xrandr --dpi 96
xautolock -time 10 -locker slimlock -detectsleep &
#clipit &
redshift -l -18.914608:-48.275380 -g 0.8 -m randr -v  &
thunar --daemon &
nitrogen --random --set-scaled /home/alex/Downloads/Wallpaper &
xbindkeys &
numlockx on &

exec bspwm
