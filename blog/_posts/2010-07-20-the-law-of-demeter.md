---
layout: blog
title: the Law of Demeter
permalink: 2010/07/the-law-of-demeter
categories: [Code]
---

<p>More formally, the Law of Demeter for functions requires that a method M of an object O may only invoke the methods of the following kinds of objects:</p>
<p>   1. O itself<br />
   2. M&#039;s parameters<br />
   3. any objects created/instantiated within M<br />
   4. O&#039;s direct component objects<br />
   5. a global variable, accessible by O, in the scope of M</p>
<p><a href="http://en.wikipedia.org/wiki/Law_of_Demeter" title="http://en.wikipedia.org/wiki/Law_of_Demeter">http://en.wikipedia.org/wiki/Law_of_Demeter</a></p>
