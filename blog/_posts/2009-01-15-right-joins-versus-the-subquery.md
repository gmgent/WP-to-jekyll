---
layout: blog
title: right joins versus the subquery
permalink: 2009/01/right-joins-versus-the-subquery
---

<p>If you&#039;re anything like me, you are a serious pragmatist. I like to get at the problem immediately, and if there are shortcuts, then we have to weight short-term versus long-term gain before we can choose sides.</p>
<p>Here is a great SQL example of this principle.</p>
<p>The old-school way to write this query would be with the subquery, like so:</p>

<script src="https://gist.github.com/860884.js?file=right_join_sample1.sql"></script>


<p>I am simply trying to verify that I have not seen sales for the &#039;Ralphs&#039; retailer come in yet, despite that &#039;merchant&#039; value already being present in the retailers table.</p>
<p>I know, it&#039;s a little confusing, but bear with me.</p>
<p>One might also write:</p>

<script src="https://gist.github.com/860890.js?file=right_join_sample2.sql"></script>


<p>Neither of these run very well. Without some added indexing, the first query won&#039;t return anything at all before it times out, and the second one runs ok but it is about 3 to 4 times slower than the right join (below).</p>

<script src="https://gist.github.com/860896.js?file=right_join_sample3.sql"></script>

<p>There you have it - right joins FTW.</p>