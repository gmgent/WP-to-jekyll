## Jekyll Base ##
https://github.com/gmgent/Axelblog-jekyll

this is a one-stop Wordpress-to-Jekyll build.

The /blog subdirectory would be where the domain root gets mapped to. The conversion script should in theory work for any WP export, I made my export file from WP 3.4.2 - Tools, Export, Posts only, and I don't use tags, just categories. If you need tag support you will have to be ready to do some hacking. Categories will work right out of the box.

## setting up ##
Clone this project.
Get your export file. 
Copy it over.
rename it.
Run the import script <pre>ruby parse_import_feed.tb</pre>

See how that works, it may need some tweaking. I don't do much conversion because I like to do that in the liquid tags, but if you are importing WP tags you may want to make sure that is working because I didn't test tag importing - my xml file didn't have any.

## the project ##
your main project folder is blog/, which means that you will be cd-ing between the main git project folder (WP-to-jekyll). Fear not, it is a good system, just remember to launch 'jekyll --server' from inside the blog directory.

I have a few pages set up for you as samples. Go nuts. Read up on [Jekyll](https://github.com/mojombo/jekyll), the main point is that anything in the blog/ directory will get copied into the /_site/ directory when you run the server. This will write html files that you can then export via the rake command in /Rakefile. I will get into that later. Just remember that you need [front matter](https://github.com/mojombo/jekyll/wiki/yaml-front-matter) in your files if you want them to be processed by liquid. Your .xml file, for example, has blank front matter. Your .js files, for example, do not. You get the picture. Also, when building .json files, we include a null at the end to avoid some problem with a trailing comma.

## search ##
Search is already wired up for you, nothing much to do there. It is a little bit of javascript that pols the search.json file for matches. I have a few hundred pages on my site and it runs fine, but if you have a huge amount of pages you may want a more robust search solution. For my needs this works perfectly and it is very solid if not optimized for speed per se.

## deployment ##
I set up a micro EC2 slice to push this to, and there is a rake command already set up to push your changes. I recommend a dedicated ip just for ease of use, but however you want to specify the host just edit the two deploy_ scripts and you will be good to go.
Deploy like this:
<pre>rake m='this is my commit message'</pre>
from the root folder one up from blog/ (WP-to-jekyll), and you can watch rsync do its magic. If you are not using a separate script to deploy assets into the blog/ folder somewhere, then you can add back the --delete option in deploy_command.rb. It's up to you.

## audio tags ##
I also wrote a Liquid filter to add audio tags in the blog template - so when you click through to the post detail page, any mp3 link will automatically use an audio tag and get served through the audiojs library. Disable/enable that per layout, like in this example from _layouts/single.html:
<pre><p class="teaser_info">{{ content | newline_to_br | add_audio_tag }}</p></pre>

the 'add_audio_tag' is what replaces the link. That code is in the plugins folder as content_filter.rb. from there you can write more custom filters in ruby which I enjoy so much more than php, I can't even tell you.

I encourage everyone to try this out on a micro slice from Amazon EC2. They have a deal right now with the first year free if you sign up for a new account, and right now the rate would be 2 cents per hour if it wasn't already free. That adds up to 12 or 13 dollars a month which is a good price when you can host as many domains as you like. My old host charged me extra every month for every domain. Read up on that [here](/vhost)