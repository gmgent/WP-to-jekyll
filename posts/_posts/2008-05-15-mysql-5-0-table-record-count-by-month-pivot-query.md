---
layout: blog
title: MySQL 5.0 Table Record Count By Month Pivot Query
permalink: 2008/05/mysql-5-0-table-record-count-by-month-pivot-query
---

<p>So there I was, hanging out at work on my birthday. I had a little time, so I decided to answer some Ruby forum questions (<a href="http://railsforum.com/" title="http://railsforum.com/">http://railsforum.com/</a>). I went through a few on them, and ended up writing a pivot query for someone, out of nostalgia for my last job where I did a lot more straight SQL programming - not like I miss it too much, but it felt good. Anyway, only once I was done did it occur to me that I could use this same query for a lot of things. It&#039;s a very multi-purpose pivot query - it pivots record counts on a single table by month, so one really fast query returns all of the record counts by month of whatever table you are curious about. The original guy on the forum needed it to turn menu buttons on and off according to whether there were records in the table for a given month (as in blog records).<br />
I recommend setting it up as a parameterized view with a single year parameter, because it won&#039;t distinguish by year otherwise. Map your parameter to where it says &#039;2008&#039; and you will be home free.</p>
<p>Instructions:<br />
1 - replace YOURTABLE with your table name.<br />
2 - replace all instances of &#039;created_at&#039; with a different (date) field name only if you want to use a different field to aggregate by. It will work fine as is with &#039;created_at&#039; because most Ruby tables have this field by default.<br />
</p>

<script src="https://gist.github.com/860968.js?file=by_month_pivot.sql"></script>
