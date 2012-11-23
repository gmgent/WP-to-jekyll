---
layout: blog
title: getting windows 7 to play nice with a mac airport express
permalink: 2012/02/getting-windows-7-to-play-nice-with-a-mac-airport-express
categories: [Code]
---

<br><br>
Something about iPv4 vs. 6 and correct DHCP authentication, I had a lot of trouble getting my windows 7 box to connect - via ethernet - to the Airport Express that I have 'extending' my mac-based network. The error message I kept getting was: 



<blockquote>"Local Area Connection" doesn't have a valid IP configuration</blockquote>



I finally got it working:



<blockquote>
1- unplug you LAN cable and wireless connection. Go to  "Ethernet Adapter local area connection 2" properties.<br>

2- select "Internet Protocol Version 4 (TCP/IPv4)"<br>

3- press Properties button<br>

4- select "Use the following IP address:" option and set this ips:<br>

 IP=<strong>192.168.1.105</strong><br>

 subnet mask=<strong>255.255.255.0</strong><br>

default gateway = your router ip address such as <strong>192.168.1.1</strong><br>

5- from second section select "Use the following DNS server addresses:"<br>

set "PreferAlternate DNS server:" your router default ip, for example <strong>192.168.1.1</strong><br>

6-press ok and try to connect through lan then wireless<br>
</blockquote>

<strong>After those steps, I also had to click through for Windows to auto-fix the problem it found that DHCP was not enabled.</strong><br>
