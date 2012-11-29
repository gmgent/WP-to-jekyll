---
layout: blog
title: update your Gemfile with one line
permalink: 2011/01/update-your-gemfile-with-one-line
postday: 01/31 2011
posttime: 16_30
categories: [code]
---

<pre>
rm -rf .bundle && bundle install && 
    git add Gemfile.lock && git commit -m "Added Gemfile.lock"
</pre><p>
Good times.</p>
