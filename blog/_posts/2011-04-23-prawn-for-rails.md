---
layout: blog
title: prawn for Rails
permalink: 2011/04/prawn-for-rails
---

<br/>
I had a question from <a href="http://twitter.com/#!/rcstolle">@rcstolle</a> on how to use Prawn, so here is a short primer. There are two ways to go - Prawn gives a pretty good amount of control via the built-in methods, so if your layout is static enough you can just build a report with what amounts to something of a cursor. Somehow it feels vaguely like Crystal Reports for those dinosaurs like me who actually used to use that once upon a time.

<script src="https://gist.github.com/895622.js?file=printable_drug_record.rb"></script>

You set the fill color, you build the table, you move to cursor down a few pixels, et cetera. Everything is pixel based and although it feels pretty solid, you don't get any CSS, you can't float anything, and in the end the use-cases are sort of limited. The other route is to use the grid-based option, which allows greater control and flexibility but also forces you to delve a little deeper into the Prawn object model. Here are some code samples to show how the Prawn::Document::Grid class can be used in practice.

Starting with the document class:

<script src="https://gist.github.com/938422.js?file=document.rb"></script>

the page:

<script src="https://gist.github.com/938424.js?file=page.rb"></script>

the section:

<script src="https://gist.github.com/938425.js?file=section.rb"></script>

and the supporting classes:

<script src="https://gist.github.com/938421.js?file=gistfile1.rb"></script>

<script src="https://gist.github.com/938419.js?file=gistfile1.rb"></script>

<script src="https://gist.github.com/938418.js?file=gistfile1.rb"></script>

which leans heavily on the <a href="http://corelib.rubyonrails.org/classes/Forwardable.html">Forwardable</a> module.

Here, although you are still working very much with pixel values, you also are specifying rows which can help with complex layouts. If you need some reference for the Prawn Grid module it is <a href="http://prawn.majesticseacreature.com/docs/0.11.1/Prawn/Document/Grid.html">here</a>.

So, the bottom line is that Prawn can handle whatever you throw at it. It is a very powerful tool and I don't know of anything that even comes close in terms of pure Ruby solutions to writing PDF reports.