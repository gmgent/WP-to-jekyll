---
layout: blog
title: this worked for me
permalink: 2009/05/this-worked-for-me
---

<p>recursevly remove .svn files from an existing repo.</p>
<p>If you need to take a project out of scm, you can run this bash script from the top folder - and it will remove all .svn folders recursively.</p>
<p>Works well for<br />
- changing an svn checkout into and svn export<br />
- switching from svn to git</p>
<p>find . -type d -name &#039;.svn&#039; -exec rm -rf {} \;</p>
