export num_monitors=$(xrandr | grep " connected" | wc -l)
export is_home=$(xrandr | grep "HDMI2 connected" | wc -l)

# work setting
if [ $num_monitors = 1 ]; then
    xrandr --output DVI-I-2-1 --off
    xrandr --output DVI-I-3-2 --off
    xrandr --output eDP-1 --auto
elif [ $is_home == 1 ]; then
    xrandr --output HDMI2 --auto
    xrandr --output HDMI2 --mode 1920x1080

    xrandr --output HDMI3 --auto
    xrandr --output HDMI3 --primary
    xrandr --output HDMI3 --mode 1920x1080
    xrandr --output HDMI3 --left-of HDMI2

    xrandr --output eDP1 --off
else
    xrandr --output DVI-I-2-1 --auto
    xrandr --output DVI-I-2-1 --mode 1920x1200

    xrandr --output DVI-I-3-2 --auto
    xrandr --output DVI-I-3-2 --primary
    xrandr --output DVI-I-3-2 --mode 1920x1200
    xrandr --output DVI-I-3-2 --left-of DVI-I-2-1

    xrandr --output eDP-1 --off
fi
