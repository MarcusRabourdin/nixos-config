# hdmi bin documentation

## hc
### General informations
  - ShareScreen my pc with the hdmi linked screen
  - Default
    * screen name: eDP-1
    * --same-as (Mirror)
    * --output: HDMI-1-1
    * --mode: 1920x1080

### Documentation
  - Use `xrandr --query` to get the avalaibe screens
  - For Relative Positioning you can use
    * --right-of
    * --left-of
    * --above
    * --below

  - For Mirroring
    * --same-as

  - Absolute Positioning
    * --pos <X>x<Y>

  - To adjust the screen resolution
    * --auto
    * --mode <X>x<Y>

### Example
  - `xrandr --output HDMI-1-1 --mode 1920x1080 --same-as eDP-1`
    
## hl
  - Disable the ShareScreen with the hdmi linked screen
  - Default
    * --output HDMI-1-1
    * --off
