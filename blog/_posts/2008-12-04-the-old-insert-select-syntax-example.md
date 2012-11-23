---
layout: blog
title: The old INSERT SELECT syntax example
permalink: 2008/12/the-old-insert-select-syntax-example
categories: [Code]
---

<p>A good example of SQL&#039;s favorite timesaver.</p>
<p>INSERT INTO `evo_bloggroups`<br />
SELECT &#039;4&#039;,<br />
bloggroup_group_ID,<br />
bloggroup_ismember,<br />
bloggroup_perm_poststatuses,<br />
bloggroup_perm_edit,<br />
bloggroup_perm_delpost,<br />
bloggroup_perm_comments,<br />
bloggroup_perm_cats,<br />
bloggroup_perm_properties,<br />
bloggroup_perm_admin,<br />
bloggroup_perm_media_upload,<br />
bloggroup_perm_media_browse,<br />
bloggroup_perm_media_change<br />
FROM `evo_bloggroups`<br />
WHERE bloggroup_blog_ID = 1<br />
<a href="http://www.digbox.net/index.php/SQL/the-old-insert-select">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
