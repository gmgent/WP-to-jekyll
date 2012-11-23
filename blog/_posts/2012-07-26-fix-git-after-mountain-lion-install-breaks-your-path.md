---
layout: blog
title: fix git after mountain lion install breaks your path
permalink: 2012/07/fix-git-after-mountain-lion-install-breaks-your-path
categories: [Code]
---

I installed Mountain Lion mainly for the new airplay feature in Safari; but after install it could no longer find my git binary. Do this to get everything back to normal.

<pre>
  sudo -s
  mkdir -p /usr/local/bin
  ln -s /usr/local/git/bin/git /usr/local/bin/git
  exit
</pre>
