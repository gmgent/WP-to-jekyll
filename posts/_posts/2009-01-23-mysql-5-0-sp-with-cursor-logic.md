---
layout: blog
title: MySQL 5.0 SP with Cursor Logic
permalink: 2009/01/mysql-5-0-sp-with-cursor-logic
---

<p>I have written a bunch of SPs over the years (stored procedure, as I learned it, but MySQL calls them Stored Routines - SRs?). I even have my best/largest/most complicated SP ever linked here at <a href='http://blog.kristeraxel.com/wp-content/uploads/2009/01/migration189.txt'>migration189</a>.
</p>
<p>That one was of course written in PL/SQL, and I have now officially moved out of the world of Oracle and into the world of MySQL 5.0 - which is sort of like moving from New York City to San Jose (weather notwithstanding).</p>
<p>Anyway, I found precious little RECENT coverage on how MySQL implemented it&#039;s &#039;stored routines&#039;, and I got to tell ya it took some digging - never mind trying to figure out how cursors work. MySQL, btw, has an ok documentation section but it is mediocre at best, somehow following in the fragmented example of the Rails community in what seems to be the curse of the open-source ADD.</p>
<p>So in the spirit of this site which has always been to keep pieces of code lying around that I may use later - here is my very first MySQL sp, which does nothing really useful except use a cursor to insert values into a table. Come back next week for the syntax needed to use parameters, lol.</p>
<p>Other things to notice - you have to declare a separate handler for pulling out of a cursor loop when you run out of records (does anyone else remember fondly how easy ADO recordsets were to use?) but other than that things look all right in MySQL land. Bye Oracle!</p>

<script src="https://gist.github.com/860870.js?file=cursor_sample.sql"></script>

<p>ps, gotta give a shout out to <a href="http://www.razorsql.com/">http://www.razorsql.com/</a> which so far has been easy to use and has served as stand-in IDE for Toad, which is what I was used to.</p>

UPDATE: I now use SEQUEL PRO. (MAR 2011)
