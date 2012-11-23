---
layout: blog
title: add aggregates to a group by
permalink: 2008/12/add-aggregates-to-a-group-by
categories: [Code]
---

<p>Pull in YTD aggregates, along with the numbers grouped by month - good example of a self-join as well as a &#039;derived table&#039; which in this example is called &#039;counted&#039;.</p>
<p>select s.product, count(s.serial_number) number_sold, year(s.item_date) y, month(s.item_date) m, counted.units<br />
from sales s<br />
join (select product, count(serial_number) units from sales group by product) counted on s.product = counted.product<br />
      group by s.product, year(s.item_date), month(s.item_date)<br />
      order by s.product, year(s.item_date), month(s.item_date)<br />
<a href="http://www.digbox.net/index.php/SQL/add-aggregates-to-a-group-by">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
