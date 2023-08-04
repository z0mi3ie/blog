---
layout: post
title: "pacman -Su throwing invalid or corrupted package (PGP Signature)"
date: 2023-08-04
---

Quick note about something I just ran into with a fix. It's been a while since 
I used my arch setup and when I tried to update some packages, `pacman -Su` was
throwing an `(invalid or corrupted package (PGP signature))` and then aborting
this install. 

I had seen this before when I was hopping between systems. 

This has to do with the fact that if an update hasn't occurred in a while,
arch package devs may have updated a few of their packages with new PGP keys.

To get passed the failed installs you simply need to:

1. update the keyring: `sudo pacman -Sy archlinux-keyring`
2. retry what you were attempting to install / update 

Quick note today, I'm sure I will run into this again in the future but this
time hopefully will remember the package name for the keyring :D 
