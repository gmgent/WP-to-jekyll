---
layout: blog
title: compiling mysql and getting the gem installed correctly
permalink: 2010/05/compiling-mysql-and-getting-the-gem-installed-correctly
postday: 05/17 2010
posttime: 22_45
categories: [Code]
---

<p>Download your preferred MYSQL version from the community download site. If you're on Snow Leopard, you may want to install the 64-bit version.</p>
<p>Install mysql via dmg or compile it from source.</p>
<p>Type ‘which mysql_config' on the terminal to locate said config. Take note of this location as we'll use it on the next step.</p>
<p>Install the mysql gem with the command below. If the location for your mysql config is different with the one below, use that instead.</p>
<pre>
sudo env ARCHFLAGS="-Os -arch x86_64 -fno-common" \
gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config
</pre><p>
worked for me!</p>
<p>thanks to <a href="http://www.sylv3rblade.com/2010/04/installing-the-mysql-gem-on-os-x-10-6-snow-leopard/" title="http://www.sylv3rblade.com/2010/04/installing-the-mysql-gem-on-os-x-10-6-snow-leopard/">http://www.sylv3rblade.com/2010/04/installing-the-mysql-gem-on-os-x-10-6...</a></p>
