---
layout: blog
title: Ruby snippet for a .collect call instead of .each
permalink: 2008/03/ruby-snippet-for-a-collect-call-instead-of-each
postday: 03/27 2008
posttime: 07_14
categories: [code]
---

<p>This works great. This is the best replacement for a &#039;For&#039; loop or one of those .each calls. This dumps out a &#039;br&#039; separated list of links for all the sub-industries in each category. I set up the model call to return a recordset, tie it to @tv_sub in the controller, and this is all it takes to get those links set up in the view:</p>
<p>&lt;% if @tv_sub -%&gt;<br />
  &lt;%= @tv_sub.collect{|si|<br />
      link_to (si.name, url_for(:action =&gt; &#039;browse&#039;, :category =&gt; &#039;tv&#039;, :sub_industry=&gt;si.name))<br />
	              }.join(&#039;&#039;)<br />
	      -%&gt;<br />
&lt;% end -%&gt;</p>
<p>And this is the model call:</p>
<p>def self.find_sub_tv<br />
  SubIndustry.find(:all, :order=&gt;&#039;name&#039;, :conditions =&gt; ["industry_id = ?", TV_ID])<br />
end<br />
<a href="http://www.digbox.net/index.php/RoR/ruby-snippet">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
