# Notes on Sway installation

## Useful Links

- Sway homepage [https://swaywm.org/]
- Sway Wiki [https://github.com/swaywm/sway/wiki]
- Useful Addons List [https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway]

## Build

Build the following:

- grim
- slurp *grim and slurp are for screenshots, package requests pending*
- network-manager *build with nmtui enabled. Optional for a network TUI, nmcli also availablebuild with nmtui enabled, must keep ahead of official releases and therefore not reccomended*
- wlsunset *Nightlight*
- wofi *Launcher, no longer maintained, but still commonly used*

## Install

Install the following from the repository. Here *optional* means Sway will function without the package, but this guide assumes you will have it

- alacritty *Terminal with good wayland support out of the box*
- dmenu *default launcher, optional*
- sway *duh*
- swaybg *sets backgrounds, optional*
- swayidle *idle manager, optional*
- waybar *menubar, optional, others available, replaces the default swaybar*
- Your preferred terminal file manager e.g. ranger, nnn, lf *optional*

## Initial Setup

- Nuke the xsession entry for sway at `/usr/share/xsession`
  - The Solus install of Sway provides X and Wayland session options to your Display Manager, you probably only want the Wayland session.
  - I have no use for the xsession, and it can be hard to distinguish from the wayland session, so nuke it.

## Surviving in Sway: A Crash Course:

- Mod key is "Windows" key by default (Mod4)
- Mod+ + enter - terminal *alacritty by default*
- Mod + d - launcher *dmenu by default*
- Mod + Shift + q - quit a window
- Mod + Shift + c - reload sway
- Mod + Shift + e - exit sway
- Move between tiles with hjkl
- Move between work spaces with number keys
- For some incomprehensible reason, the best cheatsheet for default keybindings is in this reddit thread: https://old.reddit.com/r/swaywm/comments/he9imx/what_are_the_keyboard_shortcuts_for_sway/

## Config Notes

### Default Config

Start by copying the example config from Sway:

```bash
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/
```

### Wofi

Replace the dmenu line with `set $menu wofi --show run`

### Outputs

- Each screen is an output. These lines can configure scale, position, background, etc.
- Use `swaymsg -t get_outputs` to get names of outputs on your system
- An Example

```
# "output *" is all outputs, set a background for all
output * bg ~/.config/sway/backgrounds/blade-runner-orange.png fill

# Replace my named outputs with yours
output HDMI-A-1 resolution 1920x1080 position 0,0 scale 1.0
output DP-2 resolution 1920x1080 position 1920,0 scale 1.0
```

### Swayidle

Un-comment the the swayidle lines in the default config

### Wlsunset

Nightlight function based on location. Add `exec_always wlsunset -l 49.0 -L -100.0` Change to lat/long for your location


### Waybar

- Copy waybar's default configs: `/usr/share/defaults/waybar/config` ` /usr/share/defaults/waybar/style.css`
- Replace the default `bar { .... }` lines with

```config
bar {
    swaybar_command waybar
    }
```

## Additional Config Notes *Optional*

### Gaps

- Add some gaps, if you're into that

```config
gaps inner 10
gaps outer 5
default_border pixel 2
```

### Font

- Force a different font `font pango:JetBrainsMono-Medium 13px`

### Function Keys

Bind some common function keys

```config
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
bindsym XF86MonBrightnessUp exec brightnessctl set +5%
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
```

### Force numlock

```config
input * {
    # default numlock on
    xkb_numlock enabled
}
```

## TODO

- **firefox** Try setting the following env. variable `MOZ_ENABLE_WAYLAND=1` OR enforce a GTK them like `matcha-azul`
- **systemd integration** See [here](https://github.com/swaywm/sway/wiki/Systemd-integration).