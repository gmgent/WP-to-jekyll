---
layout: blog
title: quick and dirty rake ci script
permalink: 2011/02/quick-and-dirty-rake-ci-script
postday: 02/27 2011
posttime: 20_51
categories: [Code]
---

<p>I know, it doesn&#039;t have all the bells and whistles; you need to add the files to git by hand; and you can move right through with unstaged changes with nary a peep in protest. But it still does the trick and makes my life easier - so here it is: my quick and dirty rake ci script -</p>

<script src="https://gist.github.com/860995.js?file=checkin.rake"></script>

<p>
save it in a rake file called whatever you like and do all your checkins, after doing a &#039;git add .&#039; or what have you - like this:</p>
<pre>
rake ci
</pre><p>
Done!</p>
