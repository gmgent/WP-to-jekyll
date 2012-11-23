---
layout: blog
title: get your ip from rails console
permalink: 2010/02/get-your-ip-from-rails-console
---

<pre>
`ifconfig -m en1`.scan(/inet[\s]([\d]+\.[\d]+\.[\d]+\.[\d]+)/).flatten.first

</pre>
