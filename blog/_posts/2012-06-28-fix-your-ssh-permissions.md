---
layout: blog
title: fix your ssh permissions
permalink: 2012/06/fix-your-ssh-permissions
postday: 06/28 2012
posttime: 13_38
categories: [code]
---

<strong>Permission problems with SSH</strong>

Ssh is very picky about permissions on the ~/.ssh directory and files. Sometimes you may do something to mess up these permissions. Run the following to fix most permissions problems. You may have to do this on both the remote host and local host.

<pre>
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/id_rsa
    chmod 644 ~/.ssh/id_rsa.pub  
    chmod 644 ~/.ssh/authorized_keys
    chmod 644 ~/.ssh/known_hosts
</pre>

Also no directory above ~/.ssh can have 'group' or 'other' write permissions.
