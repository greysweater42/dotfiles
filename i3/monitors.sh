export num_monitors=$(xrandr | grep " connected" | wc -l)

# work setting
if [ $num_monitors = 1 ]; then
    xrandr --output DVI-I-2-1 --off
    xrandr --output DVI-I-3-2 --off
    xrandr --output eDP-1 --auto
else
    xrandr --output DVI-I-2-1 --auto
    xrandr --output DVI-I-2-1 --mode 1920x1200

    xrandr --output DVI-I-3-2 --auto
    xrandr --output DVI-I-3-2 --primary
    xrandr --output DVI-I-3-2 --mode 1920x1200
    xrandr --output DVI-I-3-2 --left-of DVI-I-2-1

    xrandr --output eDP-1 --off
fi
