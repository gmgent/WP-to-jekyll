---
layout: blog
title: setting up a MacBook Air 2011
permalink: 2011/06/setting-up-a-macbook-air-2011
---

<br>This was copied from <a href="http://www.frederico-araujo.com/2010/08/19/installing-rails-enviroment-on-snow-leopard-with-macports-mysql-and-modrails-passenger/">this great post</a> by Frederico Araujo, with some small modifications for my own use case.

MacPorts is still a smart way to go, I tried Homebrew first and ended up in Ruby gem hell.

Also, read all the way to the bottom before you start (you may need to add wget via MacPorts before step 3).

<div class="textcontent">
<h3>Requirements:</h3> 
<ul> 
<li> Snow Leopard 10.6.4 or greater</li> 
<li> Xcode 3.2.3, 2.4.1 or greater</li> 
<li> Admin privileges on your mac.</li> 
</ul> 
<h3>Software preliminary:</h3> 
<ul> 
<li> Mysql 5.1.49 (macports)</li> 
<li> Ruby 1.8.7 (macports)</li> 
<li> Rubygems (download)</li> 
</ul> 
<h3>1. Preparing System</h3> 
<p>If you are upgrading from Leopard to Snow Leopard, I recommend you delete your old installation.</p> 
<pre class="command">sudo rm -rf \
    /opt/local \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/org.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0 \
    ~/.macports
</pre>
Note: I was setting up a new MacBook Air, so I didn't need to do this, but I left it here for reference.

<h4>1.1 Prepare PATH environment:</h4> 
<pre class="command">$vim ~/.bash_profile
</pre> 
<p>Edit your ~/.bash_profile file and add these 2 lines.<br /> 
Check if they are not there already.</p> 
<pre>export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
</pre> 
<h4>1.2 Download and Install Xcode</h4> 
<p><a href="http://developer.apple.com/technologies/xcode.html" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','developer.apple.com/technologies/xcode.html']);">http://developer.apple.com/technologies/xcode.html</a><p>
Here I used the XCode install from my Snow Leopard disc, the above link is from the original post. The link includes the XCode SDK, I think, so it's a bigger download (4gb) whereas the Snow Leopard XCode install is only 2.7gb which is all you need for just Rails stuff and with a smallish hard drive, every gb counts. Also, I did the install via driveshare from my other MacBook Pro.</p>
</p> 
<h4>1.3 Download Macports and install</h4> 
<p>Download Page: <a href="http://www.macports.org/install.php" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','www.macports.org/install.php']);">http://www.macports.org/install.php</a></p> 
<p>Download Direct Link: <a href="http://distfiles.macports.org/MacPorts/MacPorts-1.9.2-10.6-SnowLeopard.dmg" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','distfiles.macports.org/MacPorts/MacPorts-1.9.2-10.6-SnowLeopard.dmg']);">http://distfiles.macports.org/MacPorts/MacPorts-1.9.2-10.6-SnowLeopard.dmg</a></p> 
<p>You might use this guide for installing Macports:</p> 
<p>Full Install Guide: http://guide.macports.org/#installing</p> 
<h4>1.3.1 Update macports</h4> 
<pre class="command">sudo port -v selfupdate</pre> 
<h3>2. Mysql</h3> 
<h4>2.1 Install Mysql</h4> 
<pre class="command">sudo port -v install mysql5-server mysql5</pre> 
<h4>2.2 Make mysql autoload on startup</h4> 
<pre class="command">sudo port load mysql5-server
sudo -u mysql mysql_install_db5
</pre> 
<h3>3. Ruby, Rubygems, Rails, other gems</h3> 
<p>3.1 Install Ruby from macports</p> 
<pre class="command">sudo port -v install ruby</pre> 
<pre class="command">$ ruby -v
ruby 1.8.7 (2010-08-08 patchlevel 302) [x86_64-darwin10]
</pre> 
<h4>3.2 download rubygems from http://rubygems.org/pages/download</h4> 
<pre class="command">cd /tmp
wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
tar xpf rubygems-1.3.7.tgz
cd rubygems-1.3.7
sudo ruby setup.rb
</pre> 
<h4>3.3 Install rails, rake, rspec etc.</h4> 
You may want a lot of other gems, I added xml-simple, fastercsv, calendar_helper, etc., so add gems as needed, especially the mysql gem which you will need - but do that as specified in the next step.
<pre class="command">sudo gem install rake rails ruby-debug</pre>
<h4>3.4 install mysql gem</h4> 
<pre class="command">sudo env ARCHFLAGS="-arch x86_64" gem install mysql -- \ 
--with-mysql-config=/opt/local/lib/mysql5/bin/mysql_config
</pre>

DO THIS BEFORE step 3:

I had to run
<pre>sudo port install wget</pre>

before I was able to get the RubyGems install package (wget does not ship with Snow Leopard).

Other things I had to do:
<p>I had to install git from a package <a href="http://code.google.com/p/git-osx-installer/">here</a>.</p>

good luck!

</div>