---
layout: blog
title: the fizzbuzz problem
permalink: 2011/10/the-fizzbuzz-problem
postday: 10/29 2011
posttime: 13_16
categories: [code]
---

<br>

I got the idea to try this from <a href="http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html" target="_blank">this article</a> after reading <a href="http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/" target="_blank">this article</a>.

I stumbled a little on the mod function, I thought you could write 'mod' instead of using the '%' operator. So it took me just under 4 minutes. Hopefully that puts me somewhere above the middle of the pack.


<script src="https://gist.github.com/1325022.js?file=fizzbuzz.rb"></script>



Also, for the record I built a directory for the script and made sure it ran correctly within those three minutes. I saw a guy who says he did it in C in 30 seconds, and I'm pretty sure he didn't compile or run it in that time. Cheater!


<pre>
AirAxel:fizzbuzz pi$ ruby testfb.rb 
1
2
fizz
4
buzz
fizz
7
8
fizz
buzz
11
fizz
13
14
fizzbuzz
16
17
fizz
19
buzz
fizz
22
23
fizz
buzz
26
fizz
28
29
fizzbuzz
31
32
fizz
34
buzz
fizz
37
38
fizz
buzz
41
fizz
43
44
fizzbuzz
46
47
fizz
49
buzz
fizz
52
53
fizz
buzz
56
fizz
58
59
fizzbuzz
61
62
fizz
64
buzz
fizz
67
68
fizz
buzz
71
fizz
73
74
fizzbuzz
76
77
fizz
79
buzz
fizz
82
83
fizz
buzz
86
fizz
88
89
fizzbuzz
91
92
fizz
94
buzz
fizz
97
98
fizz
buzz
AirAxel:fizzbuzz pi$
</pre>
