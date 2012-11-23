---
layout: blog
title: checking JRE and JDK versions on a mac 10.6
permalink: 2011/02/checking-jre-and-jdk-versions-on-a-mac-10-6
---

<p>I know it&#039;s not rocket science, but it is worth explaining.</p>
<p>In a terminal:</p>
<pre>
  java -version
</pre><p>
will check the JRE version;</p>
<p>whereas</p>
<pre>
  javac -version
</pre><p>
will check the JDK version.</p>
<p>like so:</p>
<pre>

zeta:rockstaralley kaxel$ java -version
java version "1.6.0_22"
Java(TM) SE Runtime Environment (build 1.6.0_22-b04-307-10M3261)
Java HotSpot(TM) 64-Bit Server VM (build 17.1-b03-307, mixed mode)
zeta:rockstaralley kaxel$ javac -version
javac 1.6.0_22

</pre><p>
The JRE ships with the Mac OS (or so I&#039;m told) but the JDK installs with the XCode package.</p>
<p>you&#039;re welcome!</p>
