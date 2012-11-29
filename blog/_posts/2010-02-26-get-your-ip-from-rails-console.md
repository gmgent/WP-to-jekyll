---
layout: blog
title: get your ip from rails console
permalink: 2010/02/get-your-ip-from-rails-console
postday: 02/26 2010
posttime: 18_13
categories: [code]
---

<pre>
`ifconfig -m en1`.scan(/inet[\s]([\d]+\.[\d]+\.[\d]+\.[\d]+)/).flatten.first

</pre>
