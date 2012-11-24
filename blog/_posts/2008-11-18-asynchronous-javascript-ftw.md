---
layout: blog
title: asynchronous javascript FTW
permalink: 2008/11/asynchronous-javascript-ftw
postday: 11/18 2008
posttime: 10_54
categories: [Code]
---

<p>link_to_remote(name, options = {}, html_options = {})</p>
<p>Returns a link to a remote action defined by options[:url] (using the url_for format) that&#039;s called in the background using XMLHttpRequest. The result of that request can then be inserted into a DOM object whose id can be specified with options[:update]. Usually, the result would be a partial prepared by the controller with either render_partial or render_partial_collection.</p>
<p>Examples:</p>
<p>link_to_remote "Delete this post", :update =&gt; "posts", :url =&gt; { :action =&gt; "destroy", :id =&gt; post.id }<br />
link_to_remote(image_tag("refresh"), :update =&gt; "emails", :url =&gt; { :action =&gt; "list_emails" })<br />
You can also specify a hash for options[:update] to allow for easy redirection of output to an other DOM element if a server-side error occurs:</p>
<p>Example:</p>
<p>  link_to_remote "Delete this post",<br />
     :url =&gt; { :action =&gt; "destroy", :id =&gt; post.id },<br />
     :update =&gt; { :success =&gt; "posts", :failure =&gt; "error" }</p>
<p>Optionally, you can use the options[: position] parameter to influence how the target DOM element is updated. It must be one of :before, :top, :bottom, or :after.</p>
<p>By default, these remote requests are processed asynchronously during which various JavaScript callbacks can be triggered (for progress indicators and the likes). All callbacks get access to the request object, which holds the underlying XMLHttpRequest.</p>
<p>To access the server response, use request.responseText, to find out the HTTP status, use request.status.</p>
<p>Example:<br />
  link_to_remote word,<br />
      :url =&gt; { :action =&gt; "undo", :n =&gt; word_counter },<br />
      :complete =&gt; "undoRequestCompleted(request)"</p>
<p>The callbacks that may be specified are (in order):<br />
:loading:	Called when the remote document is being loaded with data by the browser.<br />
:loaded:	Called when the browser has finished loading the remote document.<br />
:interactive:	Called when the user can interact with the remote document, even though it has not finished loading.<br />
:success:	Called when the XMLHttpRequest is completed, and the HTTP status code is in the 2XX range.<br />
:failure:	Called when the XMLHttpRequest is completed, and the HTTP status code is not in the 2XX range.<br />
:complete:	Called when the XMLHttpRequest is complete (fires after success/failure if they are present).</p>
<p>You can further refine :success and :failure by adding additional callbacks for specific status codes:</p>
<p>Example:</p>
<p>  link_to_remote word,<br />
      :url =&gt; { :action =&gt; "action" },<br />
      404 =&gt; "alert(&#039;Not found...? Wrong URL...?&#039;)",<br />
      :failure =&gt; "alert(&#039;HTTP Error &#039; + request.status + &#039;!&#039;)"</p>
<p>A status code callback overrides the success/failure handlers if present.</p>
