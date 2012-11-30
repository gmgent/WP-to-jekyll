---
layout: blog
title: impersonating a MySQL split function
permalink: 2012/03/impersonating-a-mysql-split-function
postday: 03/05 2012
posttime: 15_42
categories: [code]
---

<br><br>

There is no string split in MySQL. How sad. Here is how I used INSTR, SUBSTRING_INDEX and LEFT to pull month day and year out of the original date field which was in the YYYY-MM-DD format - which is my favorite because it orders chronologically.

linked here: <a href="https://gist.github.com/1981662" title="mysql-split.sql">mysql-split.sql</a>

<script src="https://gist.github.com/1981662.js?file=mysql-split.sql"></script> <br><br>
