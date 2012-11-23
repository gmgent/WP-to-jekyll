---
layout: blog
title: update your Gemfile with one line
permalink: 2011/01/update-your-gemfile-with-one-line
categories: [Code]
---

<pre>
rm -rf .bundle && bundle install && 
    git add Gemfile.lock && git commit -m "Added Gemfile.lock"
</pre><p>
Good times.</p>
