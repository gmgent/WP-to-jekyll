---
layout: blog
title: strange delete syntax with join for mysql
permalink: 2011/12/strange-delete-syntax-with-join-for-mysql
categories: [Code]
---

<br/><br/>


With MySQL 5, there are two rules if you need to join to another table in order to delete records from somewhere.
<ul>
	<li>Rule 1: no aliases allowed. Refer only to tables as themselves - better hope the names aren't very long!</li>
        <li>Rule 2: specify table name from which to delete <em>before</em> the FROM clause. </li>
</ul>

Like so:

<pre>
  DELETE sales from sales
    JOIN retailers on sales.retailer_id = retailers.id
   WHERE retailers.merchant in ('Test Merchant', 
                                'Other merchants that should not be here')
</pre>


