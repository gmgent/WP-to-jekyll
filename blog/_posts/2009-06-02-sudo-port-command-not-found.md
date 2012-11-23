---
layout: blog
title: sudo port command not found
permalink: 2009/06/sudo-port-command-not-found
categories: [Code]
---

<p>sudo: port: command not found</p>
<p>are you getting this error? Add the below to your ~/.bash_profile -</p>
<p>export PATH=$PATH:/opt/local/bin<br />
export MANPATH=$MANPATH:/opt/local/share/man<br />
export INFOPATH=$INFOPATH:/opt/local/share/info</p>
<p>and then run</p>
<p>sudo port -d selfupdate</p>
<p>you should be fine (for Mac Leopard 10.5)</p>
