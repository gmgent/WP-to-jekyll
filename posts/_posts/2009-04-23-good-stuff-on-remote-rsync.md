---
layout: blog
title: good stuff on remote rsync
permalink: 2009/04/good-stuff-on-remote-rsync
---

<p>Making remote copies</p>
<p>What if you want to copy files offsite to a remote host? No problem -- all you need to do is add the host and user information. So, for instance, if you want to copy the same directory to a remote host, you&#039;d use:</p>
<p>rsync -avhe ssh --delete /home/user/dir/ user@remote.host.com:dir/</p>
<p>If you want to know how fast the transfer is going, and how much remains to be copied, add the --progress option:</p>
<p>rsync --progress -avhe ssh --delete /home/user/dir/ user@remote.host.com:dir/</p>
<p>If you don&#039;t want to be prompted for a password each time rsync makes a connection -- and you don&#039;t -- make sure that you have rsync set up to log in using an SSH key rather than a password. To do this, create an SSH key on the local machine using ssh-keygen -t dsa, and press Enter when prompted for a passphrase. After the key is created, use ssh-copy-id -i .ssh/id_dsa.pub <a href="mailto:user@remote.host.com">user@remote.host.com</a> to copy the public key to the remote host.</p>
<p>What if you need to bring back some of the files you copied using rsync? Use the following syntax:</p>
<p>rsync -avze ssh remote.host.com:/home/user/dir/ /local/path/</p>
<p>The z option compresses data during the transfer. If the file you are copying exists on the local host, then rsync will just leave it alone -- the same as if you were copying files to a remote host.<br />
Wrapping it up with a script</p>
<p>Once you&#039;ve figured out what directory or directories you want to sync up, and you&#039;ve gotten the commands you need to sync everything, it&#039;s easy to wrap it all up with a simple script. Here&#039;s a short sample:</p>
<p>rsync --progress -avze ssh --delete /home/user/bin/ user@remote.host.com:bin/<br />
rsync --progress -avze ssh --delete /home/user/local/data/ user@remote.host.com:local/data/<br />
rsync --progress -avze ssh --delete /home/user/.tomboy/ user@remote.host.com:/.tomboy/</p>
<p>also remember to to use the --dry-run option with your commands</p>
<p>** good stuff on remote rsync **</p>
