---
layout: blog
title: Perl linux and database backups
permalink: 2009/01/perl-linux-and-database-backups
postday: 01/22 2009
posttime: 00_52
categories: [code]
---

<p>I got to tell ya, most of the greatest people don&#039;t get the recognition they deserve. Open Source is all about everyone putting in what they got. So mosey on over to <a href="http://worldcommunity.com/opensource/">http://worldcommunity.com/opensource/</a> and tell Peter Brown that his Perl-based mysql backup script works like a charm.</p>
<p>It is very easy to set up, so I won&#039;t go too far into it - just download and follow the instructions. I also opted in to for the ftp push, so after the script dumps out a mysql txt file for every table, it will tar it, zip it, and push it to the ftp server of your choice. Cool.</p>
<p>This is where it gets tricky - I pulled this little gem out of a comment on Peter Brown&#039;s site. This script leaves you with a directory of txt files - most of us are used to the single .sql file of the whole db, so getting at a full restore from a bunch of txt files does not sound fun - until linux jumps in for the rescue.</p>
<p>Get this, just untar it:</p>
<p>  tar -xf bak.mysql.2009-01-20_14.55.30_.tar.gz</p>
<p>Move into that directory:</p>
<p>  cd bak.mysql.2009-01-20_14.55.30</p>
<p>and hit it with the cat xargs combo, shooting it right into mysql:</p>
<p>  find . -name "*.txt" -print | xargs -t --replace cat {} | mysql your_db_name -u your_db_user -p -h subdir.yoursite.com</p>
<p>and you&#039;re done! sweet, huh?</p>
<p>p.s. - the -h switch at the end (-h subdir.yoursite.com) is not always necessary, if it is localhost you can leave it out.<a href="http://www.digbox.net/index.php/dba/mysql/perl-linux-and-database-backups">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
