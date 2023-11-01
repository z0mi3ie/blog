---
layout: post
title: "cvt + xrandr fix on debian setup"
date: 2023-11-01
---

Recently I installed a fresh Debian system to change some things up, and also have more parity between my work 
computer and home. I have jumped between Arch and Debian for a long time now and its a cycle that probably won't end.

I started with base Debian, no desktop environment from the install, but just the basic utilities bundle.

Anyways, my dual monitor (+the laptop display) was giving me issues coming up like I had it in Arch. 

The laptop display and the 1440p display were no problem. They booted up from the script I had written 
about previously. But the third display was giving me issues. It was connected as shown with `xrandr -q`
but would not leave the blank screen. "No source found". This felt like an issue with setting the refresh rate. 

Setting different refresh rates from the existing modes didn't really help. After googling a bit I decided that
I should try adding a new mode with `cvt`. 

```
➜  ~ cvt 1920 1080 60
# 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
```

Then added it as a new mode to `xrandr`.

```
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
```

And then adding it to the available modes for my display (`DP-3-2`)

```
xrandr --addmode DP-3-2 1920x1080_60.00
```

Finally, updating the output for that display and it works!

```
xrandr --output DP-3-2 --mode 1920x1080_60.00
```

And at last, I updated my previous script for running when my desktop comes up. 

```
#!/bin/sh

MNTR_ASUS="DP-3-2"
MNTR_PRED="DP-3-1"
MNTR_YOGA="eDP-1"

ASUS_MODE_LINE=$(cvt 1920 1080 60 | sed -n '2p' | cut -d ' ' -f 2-)
ASUS_MODE=$(echo $ASUS_MODE_LINE | cut -d ' ' -f 1 | sed s/\"//g)

xrandr --newmode $ASUS_MODE_LINE
xrandr --addmode ${MNTR_ASUS} ${ASUS_MODE}

xrandr --output ${MNTR_ASUS} \
       --mode $ASUS_MODE \
       --above ${MNTR_YOGA} 

xrandr --output ${MNTR_YOGA} \
       --rotate inverted \
       --left-of ${MNTR_PRED}

~/.fehbg &
```

