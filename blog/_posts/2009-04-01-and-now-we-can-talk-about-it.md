---
layout: blog
title: and now we can talk about it
permalink: 2009/04/and-now-we-can-talk-about-it
postday: 04/01 2009
posttime: 11_01
categories: [historical]
---

<p>Well, the one good thing I'm getting out of this redesign is that I can dump all of these posts out into the vast night and no one will see them. And so I am able to see how this whole thing shakes out.</p>
<p>I will tell the story, fully hoping that no one will read it, as a strange testament to what gives me pleasure as well as a good example of how sweet technology is.</p>
<p>As some of you know, I make my living as a software developer. It's been about ten years now that I spend about ten dollars for every dollar I make as a songwriter in the process of making songs. The return is there, but without some good seed capital it feels a little like blowing on an ember with your nose. But I digress.<br />
So there I was, growing up as a rockstar and office whore. Trying to make a statement. It was about 8 years ago that both I moved here and I decided to live two lives. I only mention this because I am now announcing that this double life is over. I have married both of my blogs to each other just as I soon will marry my beloved and thus I am saying 'Yes, it may be that I will post both song lyrics and code snippets; I may be both rockstar and nerd and that is just the way of it.'</p>
<p>And so it is. My weird 'why is the server called digbox if the site says codeboxer?' days are over. There will be one server to rule them all.</p>
<p>Hehe, so anyway to finish the story I was trying to consolidate and had some problems moving my 'nerd' blog over to the mothership, so to speak, and finally the light went off. This Drupal 6 is sort of the bomb. Why don't I dump that crappy b2Evolution installation that won't port nicely and just drive all of my posts from TheAxelVault (aka kristeraxel.com)? </p>
<p>So then I'm looking for a way to export b2Evolution and I see that there isn't one. I stumble across a blog post that suggests 'why not just set up a view to aggregate everything you want dumped as an rss feed and do it that way?'</p>
<p>And I say, yeah, why not? Great idea.</p>
<p>So my posts don't look as good as they used to because they got sucked through the SimplePie rss machine but they are there. I did the same thing with my podcast posts. Now I post everything from here, and it shoots out to the appropriate feed lickety split.</p>
<p>But here's the kicker. I used these 2 php libraries (class_http.php and class_xml.php) that I got here <a href="http://www.troywolf.com/articles/php/class_http/" title="http://www.troywolf.com/articles/php/class_http/">http://www.troywolf.com/articles/php/class_http/</a> and I built my own server-side search parser, totally simple and barebones, and it's a self-updating site now. I set up the feed through google and I use the little google script to populate the home page (cached every 60 minutes). The only other page is the search page and it takes search parameters from the GET, sets up it's own little hardcoded tag dictionary on the fly for menu items, and hits the (also cached) rss feed for every search, slices up the xml file according to your search tag, and serves it up. I'm so proud I keep messing with it.</p>
<p>for those who have no idea what I just said, I basically replaced a whole blog site that I used to have to maintain with 2 simple pages that update and search themselves on their own - based on posts that I drive from this site. Talk about simplifying your life!</p>
<p>The only downside is that it will probably kill some old links, but hey, such is life.</p>
<p>check it out at <a href="http://codeboxer.com/" title="http://codeboxer.com/">http://codeboxer.com/</a></p>
<p>*** and now we can talk about it ***</p>
