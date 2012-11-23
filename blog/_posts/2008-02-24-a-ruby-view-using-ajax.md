---
layout: blog
title: A Ruby View using AJAX
permalink: 2008/02/a-ruby-view-using-ajax
categories: [Code]
---

<p>There is a lot going on here, perhaps too much, but this serves as a nice example.</p>
<p>&lt;% i=0 %&gt;</p>
<p>&lt;% for l in @hood.locations %&gt;</p>
<p>		&lt;% i=i+1 %&gt;<br />
		&lt;% if l == @location then %&gt;<br />
		  &lt;% lmain = l.name %&gt;<br />
		  &lt;%= image_tag("http://www.noonchild.com/art/rockstaralley2_41.png") %&gt;<br />
		&lt;% else %&gt;<br />
          &lt;%= link_to image_tag("#{l.graflink}", :border=&gt;0, :title =&gt; l.name), :action =&gt; &#039;move&#039;, :id =&gt; l %&gt;<br />
		&lt;% end %&gt;<br />
&lt;% end %&gt;&lt;%= lmain %&gt;</p>
<p>&lt;% for o in @options -%&gt;<br />
	&lt;%= link_to_remote( image_tag("#{o.graflink}", :border =&gt; 0, :title =&gt; o.description), {<br />
	    :update =&gt; "current_message",<br />
	    :url =&gt;{ :action =&gt; o.link, :controller =&gt; o.controller },<br />
	    :complete =&gt; {"document.getElementById(&#039;message_answer&#039;).style.display = &#039;block&#039;; document.getElementById(&#039;current_message&#039;).style.display = &#039;block&#039;;Element.update(&#039;option_message&#039;,&#039;#{o.name}&#039;);",<br />
	    remote_function(:update =&gt; &#039;x&#039;,<br />
				 :url =&gt; { :action =&gt; :set_option, :id =&gt; o })}<br />
		         },{<br />
		:onmouseover =&gt; {"Element.update(&#039;option_preview&#039;,&#039;#{o.name}&#039;);<br />
                    document.getElementById(&#039;option_message&#039;).style.display = &#039;none&#039;; ",<br />
                    visual_effect(:fade,"flashmessage", :duration =&gt; 2.5 )},<br />
		:onmouseout =&gt; "Element.update(&#039;option_preview&#039;,&#039;&#039;);document.getElementById(&#039;option_message&#039;).style.display = &#039;block&#039;;"		}<br />
		) -%&gt;<br />
&lt;% end -%&gt;</p>
<p>&lt;% start_form_tag :action =&gt; &#039;optin&#039; do |f| -%&gt;<br />
&lt;%= submit_tag &#039;Say yes.&#039;, :onclick =&gt; "document.getElementById(&#039;ajaxsubmit&#039;).style.display = &#039;inline&#039;;"  %&gt;<br />
	&lt;% end_form_tag %&gt;&lt;%= image_tag("http://digbox.net/art/ajax-loader.gif", :border=&gt;0) %&gt;<br />
&lt;% end -%&gt;<br />
&lt;%= image_tag("http://digbox.net/art/ajax-loader.gif", :border=&gt;0) %&gt;</p>
<p><em>Places to go, things to do</em></p>
<p>    &lt;% for h in Hood.find(:all) %&gt;<br />
      &lt;% if h != @hood then %&gt;<br />
        &lt;%= link_to image_tag("#{h.graflink}", :border=&gt;0), {:action =&gt; &#039;move_hood&#039;, :id =&gt; h}, :onclick =&gt; visual_effect(:Fade,"enthusiasm") %&gt;</p>
<p>        &lt;%= h.name %&gt;<br />
	  &lt;% end %&gt;<br />
	&lt;% end %&gt;</p>
<p>	    &lt;%= render :partial =&gt; &#039;form&#039; %&gt;</p>
<p><a href="http://www.digbox.net/index.php/RoR/a-ruby-view-using-ajax">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
