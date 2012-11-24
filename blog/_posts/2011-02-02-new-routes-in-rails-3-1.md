---
layout: blog
title: new routes in rails 3.1
permalink: 2011/02/new-routes-in-rails-3-1
postday: 02/02 2011
posttime: 06_50
categories: [Code]
---

<p>explained here:</p>
<p><a href="http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/" title="http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/">http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/</a></p>
<p>I was already on 3.0.3, so it basically amounted to removing the |map| from</p>
<pre>
Rockstaralley::Application.routes.draw do |map|
  #routes are mapped here
end
</pre><p>
which was fine with me.</p>
