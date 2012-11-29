---
layout: blog
title: reset your mac lion launchpad
permalink: 2012/06/reset-your-mac-lion-launchpad
postday: 06/28 2012
posttime: 22_20
categories: [code, random]
---

You know, because errors happen all the time. Oh Apple, get it together. Steve Jobs is rolling over in his grave right now.

<pre>

    Launch Terminal (from /Applications/Utilities/Terminal).
    Navigate to the Application Support folder in question using:
    cd ~/Library/Application\ Support/Dock
    Open the folder (open .) and drag all the .db files to the trash.
    Restart Dock (sudo killall Dock, followed by authentication)
</pre>

before:<br/>

<a href="http://blog.kristeraxel.com/wp-content/uploads/2012/06/Screen-Shot-2012-06-28-at-10.16.55-PM1.png"><img src="http://blog.kristeraxel.com/wp-content/uploads/2012/06/Screen-Shot-2012-06-28-at-10.16.55-PM1-300x66.png" alt="" title="Screen Shot 2012-06-28 at 10.16.55 PM" width="300" height="66" class="aligncenter size-medium wp-image-1901" /></a><br/>

After:
<br/>
<a href="http://blog.kristeraxel.com/wp-content/uploads/2012/06/Screen-Shot-2012-06-28-at-10.18.28-PM.png"><img src="http://blog.kristeraxel.com/wp-content/uploads/2012/06/Screen-Shot-2012-06-28-at-10.18.28-PM-300x128.png" alt="" title="Screen Shot 2012-06-28 at 10.18.28 PM" width="300" height="128" class="aligncenter size-medium wp-image-1902" /></a><br/><br/>

I know, just blame it on Diablo III.
