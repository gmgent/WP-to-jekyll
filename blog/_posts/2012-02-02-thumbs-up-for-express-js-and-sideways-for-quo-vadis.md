---
layout: blog
title: thumbs up for express js and sideways for quo vadis
permalink: 2012/02/thumbs-up-for-express-js-and-sideways-for-quo-vadis
---

<br><br><p>
I've just been checking out some stuff lately and have been dying to try out <a href="http://axel.me/5m" target="_blank">express.js</a>, which is built on the <a href="http://nodejs.org/" target="_blank">node.js</a> framework. It is easy to use, super fast, and very cool. I highly recommend it for a lightweight and snappy front-end.</p>

<p>
Also, I am finally making the jump to Rails 3.2, and for that reason am porting my entire <strong>gmgpulse</strong> app, complete with new auth layer and switching from prototype to jQuery. It's a lot of work but will pay many dividends. Essentially I am paying off some existing technical debt and moving the whole enterprise back into the black! I am trying out a very simple and effective auth gem called <a href="http://axel.me/7l" target="_blank">'quo_vadis'</a> but currently it has a problem with the 3.2 release so I am crossing my fingers that the guy who manages the gem will merge the pull request soon - it has already been fixed. I figure since I have about 30-60 days before it needs to work, I may be all right.
</p>


<p>
UPDATE: The gem owner has merged the pull request, and quo vadis is back to 100% functional with Rails 3.2 (as of gem v1.1.2). I give it a full thumbs up now as well - simple, straightforward, easy set up, everything you want in a simple password auth system. There is no support for outside services - FB, or google, or open id, etc. - but sometimes you don't need that and it just creates unneeded complexity.
</p>