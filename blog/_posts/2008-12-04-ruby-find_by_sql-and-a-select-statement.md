---
layout: blog
title: Ruby find_by_sql and a select statement
permalink: 2008/12/ruby-find_by_sql-and-a-select-statement
postday: 12/04 2008
posttime: 10_05
categories: [Code]
---

<p>This is how I still do things. I don&#039;t think it&#039;s terribly old-fashioned. Databases are still faster than web servers, aren&#039;t they?</p>
<p>  Summary.find_by_sql(["<br />
    (select &#039;GMG&#039; name, 0 id, 1 orderby<br />
       from partners where 1=1)<br />
      union<br />
    (select display_val name, p.id, 2 orderby<br />
       from partners p where active = 1)<br />
   order by orderby, name, id"<br />
          ])</p>
<p><a href="http://www.digbox.net/index.php/SQL/ruby-find_by_sql-and-a-select-statement">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
