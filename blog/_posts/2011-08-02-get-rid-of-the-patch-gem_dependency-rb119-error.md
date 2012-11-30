---
layout: blog
title: get rid of the patch gem_dependency.rb:119 error
permalink: 2011/08/get-rid-of-the-patch-gem_dependency-rb119-error
postday: 08/02 2011
posttime: 16_20
categories: [code]
---

Hate this error?

<pre>
fix version_requirements is deprecated <br>
and will be removed on or after August 2010. <br>
Use #requirement
</pre><br><br>

Use this:<br><br>

<script src="https://gist.github.com/1143138.js?file=gistfile1.txt"></script><br><br>

copied from <a href="http://www.mattvsworld.com/blog/2010/03/version_requirements-deprecated-warning-in-rails/">here</a><br><br>

Just remember to switch out the directory after -d with wherever gem_dependency.rb lives on your system (it's in the warning message). It is probably bad practice to patch your system gems, but to get rid of this warning we can make an exception...

If something goes wrong, reverse the patch with: <br><br>


<script src="https://gist.github.com/1143140.js?file=gistfile1.txt"></script>

