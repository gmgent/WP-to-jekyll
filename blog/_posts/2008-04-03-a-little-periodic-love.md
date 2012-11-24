---
layout: blog
title: a little periodic love
permalink: 2008/04/a-little-periodic-love
postday: 04/03 2008
posttime: 07_18
categories: [Code]
---

<p>Although I didn&#039;t actually end up using it, this little snippet did work like a charm.</p>
<p>&lt;%= periodically_call_remote(:update =&gt; "preview",:frequency =&gt; 3, :url =&gt; {:controller =&gt; &#039;resource&#039;, :action =&gt; &#039;highlights&#039;, :id =&gt; @facebook_id }) %&gt;</p>
<p>Just put it in a view somewhere, and it will call your remote function and update whatever you want at a given interval.</p>
<p>Sweet.<a href="http://www.digbox.net/index.php/RoR/a-little-periodic-love">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
