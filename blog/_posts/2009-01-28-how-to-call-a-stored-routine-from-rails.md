---
layout: blog
title: how to call a stored routine from Rails
permalink: 2009/01/how-to-call-a-stored-routine-from-rails
---

<p>So you wanna call your own stored routine, eh?<br />
Here ya go - the right syntax. I read on a blog somewhere that you send any command to the database through a .find_by_sql command, but that turned out to be a load of baloney. Is there anything Ruby + ActiveRecord can&#039;t do?</p>
<script src="https://gist.github.com/860862.js?file=call_stored_routine.rb"></script>
<p>Clothing, I mean transaction support is optional.</p>