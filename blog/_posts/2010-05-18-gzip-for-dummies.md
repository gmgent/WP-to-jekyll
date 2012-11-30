---
layout: blog
title: gzip for dummies
permalink: 2010/05/gzip-for-dummies
postday: 05/18 2010
posttime: 21_13
categories: [code]
---

<p>GZIP To Compress Files:</p>
<p>The syntax for Gzip is</p>
<p>gzip filename<br />
The resulting file will be filename.gz - notice the .gz file extension. If you were compressing a tar file for example, the resulting file would be filename.tar.gz, and so on.</p>
<p>To achieve better compression, you can use the -9 option. (i.e. gzip -9 filename) This will take a little longer, but will result in your compressed file taking up less space.</p>
<p>GUNZIP To Expand Files:</p>
<p>To uncompress a file, the sister to Gzip is Gunzip. To uncompress a file, simply type</p>
<p>gunzip filename</p>
<p>Just like any UNIX program, full usage instructions for Gzip can be found using the man tool. Simply type man gzipat the prompt for full instructions.</p>
