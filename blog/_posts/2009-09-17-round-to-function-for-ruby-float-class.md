---
layout: blog
title: round to function for ruby float class
permalink: 2009/09/round-to-function-for-ruby-float-class
postday: 09/17 2009
posttime: 22_25
categories: [Code]
---

<p>I found this on a blog post somewhere, and it works really well. If you need to round your decimals to precision, this is your friend. It&#039;s a method extension for the standard float class in Ruby on Rails. Just save it into your lib/ folder as whatever you want, and &#039;require&#039; it in as needed - like so:</p>
<pre>
  require &#039;float_helper&#039;
</pre><p>
I called it &#039;float_helper.rb&#039;.</p>
<p>Behold:</p>
<script src="https://gist.github.com/860803.js?file=float_helper.rb"></script><p>
used here to great effect as a simple round to integer:</p>
<pre>
  unaccounted_sales = x["value"].to_f.round_to(0)
</pre><p>
but you can specify the precision as you like.</p>
<p>Enjoy!</p>
