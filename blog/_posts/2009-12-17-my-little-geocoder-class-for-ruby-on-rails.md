---
layout: blog
title: my little geocoder class for Ruby on Rails
permalink: 2009/12/my-little-geocoder-class-for-ruby-on-rails
postday: 12/17 2009
posttime: 18_20
categories: [code]
---

<p>works like a charm.</p>
<script src="https://gist.github.com/860798.js?file=geocoder.rb"></script><p>
and is used like this:</p>
<pre>

ll = GetLatLong.new
ll.address=address_value
ll.city=city_value
ll.state=state_value
ll.zip=zip_value
puts ll.run
send_this[6]=ll.latitude
send_this[7]=ll.longitude

</pre><p>
Nice and easy.</p>
