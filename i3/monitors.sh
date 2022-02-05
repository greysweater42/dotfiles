export num_monitors=$(xrandr | grep " connected" | wc -l)

# work setting
if [ $num_monitors = 1 ]; then
    xrandr --output HDMI-1 --off
    xrandr --output eDP-1 --auto
    xrandr --output eDP-1 --primary
else
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --primary
    xrandr --output eDP-1 --off
fi

