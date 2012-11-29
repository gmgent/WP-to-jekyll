---
layout: blog
title: FTPS for dummies
permalink: 2011/01/ftps-for-dummies
postday: 01/28 2011
posttime: 01_29
categories: [Code]
---

<p>Yah, I know it&#039;s been a while, but I&#039;ve been busy. Work, family, vacation, video games - it&#039;s a long list.</p>
<p>Anyway, for my first post of the year, I am posting code that I found here:</p>
<p><a href="http://blog.behindlogic.com/2009/03/ruby-ftps-implicit-ssl.html" title="http://blog.behindlogic.com/2009/03/ruby-ftps-implicit-ssl.html">http://blog.behindlogic.com/2009/03/ruby-ftps-implicit-ssl.html</a></p>
<p>written by a nice gentleman named Daniel Parker, who basically got to it first.</p>
<p>I have long known that the standard FTP class that rolls with Rails has no knowledge of or familiarity with FTPS, which is FTP with implicit ssl which is a new standard by our &#039;friends&#039; at Microsoft, who never met a party they didn&#039;t want to piss on (true story).</p>
<p>Anyway, the bullet finally found me and  from now on I will have to learn to make my Rails 2.3.5 app play nice with IIS. First step - connecting via FTPS to pull files down - we used to use SFTP but I guess that was either too simple and/or functional for the Microsoft team to get on board.</p>
<p>I found the above post by Mr. Parker, and it helped a lot. Here is the code:</p>

<script src="https://gist.github.com/860690.js?file=ftps.rb"></script>

<p>
Use it just as you would the FTP class.</p>
<p>Here it is in a rake test task (because I don&#039;t like my test suite to actually connect to live servers):</p>

<script src="https://gist.github.com/860998.js?file=ftps_rake_test.rake"></script>

<p>
Got it?</p>
<p>also many thanks to Daniel Parker for making my life a little easier and posting the code so generously.</p>
</></pre>
