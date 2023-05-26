---
layout: post
title: "minima jekyll theme + gruvbox color scheme"
date: 2023-05-26
---

# Customizing the jekyll theme

I'm very happy with the blog so far w/ jekyll and github pages. It's a nice place to build content.
It's admittedly also nice to work on something different than my day job in the backend and get
at least some front end work done, even if its just like sass :).

For years I've been using [gruvbox](https://github.com/morhetz/gruvbox) as my vim colorscheme.
Honestly though, anywhere I can slide some gruvbox flair into I will. So for the blog, I wanted
to replace the standard `minima` theme with it.

Customizing jekyll is pretty slick, you just basically copy over whatever files you want
to change to the top of the repo and go ham. One thing I did though was pull down the
actual [minima](https://github.com/jekyll/minima) theme and copied all of the top level directories
over so I could get a feel for everything we can customize and how minima is laid out.

Specifically `_includes`, `_layouts`, `_sass`, `assets`, and `site`.

There is a few nice empty files that are provided like `_sass/minima/custom-variables.scss`
where you can define your own vars to customize.

I went through `_base.scss` and `_layout.scss` and pulled out all referenced
color variables so I could easily assign the gruvbox colors to them.

I then added all the `gruvbox` color vars and just assigned them to which `minima` color
variables I thought would look good for reading material. This is what I ended up with so far.
(which probably isn't exactly what you see when you read this, but probably close).


**_sass/minima/custom_variables.scss**
```scss
// gruvbox (dark) pallette
$dark-bg-0: #282828;
$dark-bg-0-h: #1d2021;
$dark-bg-1: #3c3836;
$dark-bg-2: #504945;
$dark-bg-3: #665c54;
$dark-bg-4: #7c6f64;
$dark-gray-1: #928374;
$dark-gray-2: #a89984;
$dark-bg-bg0_h: #1d2021;
$dark-red-1: #cc241d;
$dark-red-2: #fb4934;
$dark-green-1: #98971a;
$dark-green-2: #b8bb26;
$dark-yellow-1: #d79921;
$dark-yellow-2: #fabd2f;
$dark-blue-1: #458588;
$dark-blue-2: #83a598;
$dark-purple-1: #b16286;
$dark-purple-2: #d3869b;
$dark-aqua-1: #689d6a;
$dark-aqua-2: #8ec07c;
$dark-fg: #ebdbb2;
$dark-fg-4: #a89984;
$dark-fg-3: #bdae93;
$dark-fg-2: #d5c4a1;
$dark-fg-1: #ebdbb2;
$dark-fg-0: #fbf1c7;
$dark-orange-1: #d65d0e;
$dark-orange-2: #fe8019;

// gruvbox (light) pallette
$light-bg-0: #fbf1c7;
$light-bg-0-h: #f9f5d7;
$light-bg-1: #ebdbb2;
$light-bg-2: #d5c4a1;
$light-bg-3: #bdae93;
$light-bg-4: #a89984;
$light-red-1: #cc241d;
$light-green-1: #98971a;
$light-yellow-1: #d79921;
$light-blue-1: #458588;
$light-purple-1: #b16286;
$light-aqua-1: #689d6a;
$light-gray-1: #7c6f64;
$light-gray-2: #928374;
$light-red-2: #9d0006;
$light-green-2: #79740e;
$light-yellow-2: #b57614;
$light-blue-2: #076678;
$light-purple-2: #8f3f71;
$light-aqua-2: #427b58;
$light-fg: #3c3836;
$light-fg-4: #7c6f64;
$light-fg-3: #665c54;
$light-fg-2: #504945;
$light-fg-1: #3c3836;
$light-fg-0: #282828;
$light-orange-1: #d65d0e;
$light-orange-2: #af3a03;

// blog color codes
$text-color: $dark-fg;
$background-color: $dark-bg-0;
$site-title-color: $dark-aqua-1;
$link-base-color: $dark-green-1;
$link-visited-color: $dark-green-1;
$link-hover-color: $dark-green-2;
$brand-color: $dark-purple-1;
$border-color-01: $dark-blue-2;
$border-color-03: $dark-blue-2;
$code-background-color: $dark-bg-0-h;
$icon-color-1: $dark-orange-1;
$icon-color-2: $dark-orange-2;

// unused so far, so make them obvious for when I add tables :)
$table-text-color: #ffff00;
$table-border-color: #ffff00;
$table-zebra-color: #AAAA00;
$table-header-bg-color: #999900;
$table-header-border: #999900;
```

I did adjust some of the default `scss` like border widths and adding `color`
to specific classes, which just inherited the same colors. Nothing crazy at all
though, its just vanilla minima with some tweaks.

Thanks for reading!

