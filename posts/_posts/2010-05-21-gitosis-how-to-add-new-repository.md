---
layout: blog
title: gitosis and how to add new repository
permalink: 2010/05/gitosis-how-to-add-new-repository
---

<p>gitosis: how to add new repository</p>
<p>I assume that you already have your gitosis-admin repository working (this is described elsewhere).</p>
<p>   1. cd gitosis-admin &amp;& git pull - enter your gitosis administrative repository and ensure it is up-to-date<br />
   2. $EDITOR gitosis.conf<br />
   3. add [group newreponame] section (newreponame is the name of your new repository being added); add yourself with members = yourlogin@yourhost line; also add writable = newreponame line:</p>
<pre>
          [group newreponame]
          members = yourlogin@yourhost
          writable = newreponame
</pre><p>   4. based on my assumption of a correctly setup gitosis-admin repository, you should already have the appropriate public key in the keydir directory, but if not - copy your user's ssh public key to keydir in the form of <a href="mailto:yourlogin@yourhostname.pub">yourlogin@yourhostname.pub</a>, then do git add keydir/yourlogin@yourhostname.pub<br />
   5. git commit -am ‘new repository: newreponame'; git push;<br />
   6. now that you have the new repo permissions configured, let's actually create it. Navigate to the directory holding the files of your project (e.g. cd ~/newreponame), and do git init; git add . - this initializes empty git repository, and then adds all the files to it.<br />
   7. git commit -m ‘initial commit'<br />
   8. git remote add origin ssh://gitosis@yourGitosisServerName/newreponame.git<br />
   9. git push --all<br />
  10. final thing: git config --add branch.master.remote origin &amp;& git config --add branch.master.merge refs/heads/master; alternatively, cd .git &amp;& $EDITOR config, and then add these lines:</p>
<pre>
          [branch "master"]
          remote = origin
          merge = refs/heads/master
</pre><p>      Without these lines, you won't be able to git pull.</p>
<p>      copied from: <a href="http://bogdan.org.ua/2009/02/20/gitosis-how-to-add-new-repository.html" title="http://bogdan.org.ua/2009/02/20/gitosis-how-to-add-new-repository.html">http://bogdan.org.ua/2009/02/20/gitosis-how-to-add-new-repository.html</a></p>
