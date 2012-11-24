---
layout: blog
title: Yahoo geocoder is gone
permalink: 2011/11/yahoo-geocoder-is-gone
postday: 11/02 2011
posttime: 12_06
categories: [Code]
---

<br>
Yahoo quietly discontinued it's geocoding feature in September. I kept getting 503 errors until I looked at the <a href="http://developer.yahoo.com/maps/" target="_blank">Yahoo developer maps page</a>. I wonder if they were just using google maps on the backend and couldn't afford the new pricing structure.

Bummer, because I used it for almost everything I do with calculating latitude and longitude values on the fly. I am now refactoring to use <a href="http://code.google.com/apis/maps/faq.html" target="_blank">google maps</a> instead. One might argue that I should have done that to start with.<br>


<a href="http://blog.kristeraxel.com/wp-content/uploads/2011/11/Screen-shot-2011-11-02-at-10.51.10-AM.png"><img src="http://blog.kristeraxel.com/wp-content/uploads/2011/11/Screen-shot-2011-11-02-at-10.51.10-AM-300x69.png" alt="" title="Screen shot 2011-11-02 at 10.51.10 AM" width="300" height="69" class="aligncenter size-medium wp-image-1428" /></a>
