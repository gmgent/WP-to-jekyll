---
layout: blog
title: The change you wanted was rejected.
permalink: 2011/04/the-change-you-wanted-was-rejected
---

 
<blockquote>Maybe you tried to change something you didn't have access to.</blockquote>

<a href="http://blog.kristeraxel.com/wp-content/uploads/2011/04/fb-error.png"><img src="http://blog.kristeraxel.com/wp-content/uploads/2011/04/fb-error-300x111.png" alt="" title="fb-error" width="300" height="111" class="aligncenter size-medium wp-image-995" /></a><br/>
If you see this on your Rails-based Facebook app, try disabling 'protect_from_forgery' in your ApplicationController. Facebook uses signed_request that you can decode and use to verify that the request actually comes from Facebook, so protect_from_forgery is unnecessary for applications that are accessible through the facebook canvas only.
