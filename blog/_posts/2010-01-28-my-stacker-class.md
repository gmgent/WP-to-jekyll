---
layout: blog
title: my stacker class
permalink: 2010/01/my-stacker-class
postday: 01/28 2010
posttime: 23_21
categories: [code]
---

<p>For anyone that uses FusionCharts, this little class may be very helpful.</p>
<p>It is for building xml files to feed FusionCharts &#039;Stacked&#039; charts, and it has already saved my ass.</p>

<script src="https://gist.github.com/860786.js?file=stacker.rb"></script>

<p>
The only kicker is that you need your own &#039;pad_month&#039; function to add a pad zero to any single digits in your day.</p>
<p>So get rid of the Utils module and stick in this pad_month method and you should be golden.</p>
<pre>
def pad_month(this)
  if this.to_i &lt; 10
    return "0#{this}"
  else
    return "#{this}"
  end
end
</pre>
