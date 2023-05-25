---
layout: post
title: "npm issues: SSL, EACCES: permission denied"
date: 2023-05-25
---

## `npm ERR! Error: SSL Error SELF_SIGNED_CERT_IN_CHAIN`

On my freshly setup system I wasn't really expecting a ton of `npm` headaches so quickly. 

I had some `npm` dependencies early on so I originally installed `npm:latest` through `pacman`.
I wasn't expecting to do much `node` development right off the cuff but with wanting
to checkout some blogging options -- I was quickly in the mix.

Due to some of those dependencies, I needed to grab `nvm` and get node 18 going. 

Ultimately, in the name of getting posts out, I decided to stick to a `jekyll` blog in github pages,
but left `nvm` installed and managing my node versions, and forgot I did this. 

A few days later I tried grabbing `terminalizer` to be able to render some CLI demos and started 
getting node's `SSL Error SELF_SIGNED_CERT_IN_CHAIN`. So I went through the list of known steps to bypass this (even temporarily) 

- `export NODE_EXTRA_CA_CERTS=""` (I had updated this with my own for some Digital Ocean stuff, thought this might be the culprit)
- `export NODE_TLS_REJECT_UNAUTHORIZED=0`
- `npm config set strict-ssl=false`
- manually check the `.npmrc` 
- set the npm registry to `http` version instead of `https`

I think a few other things were tried but basically, nothing I was doing was affecting the fact the that `strict-ssl` flag was set to false
or that the node registry was pointed at `http`. The values were correct in `.npmrc` but npm was not respecting them. 

I found the `nvm` init lines in my `.zshrc` and remembered I was using that. So I uninstalled nvm:

- `rm -rf $NVIM_DIR`
- removed the lines from `.zshrc`

and my SSL problems were **SOLVED** on my next `npm install`. 

Temporarily at least -- until I pull down `nvm` again. I now know that it has to do with configuration while using `nvm`.

## EACCES: permission denied

Though the next issue was `EACCES: permission denied` when trying to install global packages. 

I didn't want to have to debug the `nvm` and `SSL` errors yet, so in the meantime I wanted
to setup a global spot in my home directory. 

- `mkdir ~/.npm-global`
- `npm config set prefix '~/.npm-global'`
- `export PATH=$PATH:$HOME/.npm-gobal/bin`
- `npm install -g terminalizer` 

And with that, I have a non-nvm global working npm with no SSL issues. 

 
