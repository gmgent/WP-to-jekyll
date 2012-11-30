## Jekyll Base ##
https://github.com/gmgent/Axelblog-jekyll

this is an attempt at a one-stop Wordpress-to-Jekyll build.

The test.rb script is used to import the wordpress export file. the /blog subdirectory would be where the domain root gets mapped to. The conversion script should in theory work for any WP export, I made my export file from WP 3.4.2 - Tools, Export, Posts only, and I don't use tags, just categories. If you need tag support you will have to be ready to do some hacking. Categories will work right out of the box.

## setting up ##
Clone this project.
Get your export file. 
Copy it over. 
Run the import script <pre>ruby parse_import_feed.tb</pre>

See how that works, it may need some tweaking. I don't do much conversion because I like to do that in the liquid tags, but if you are importing WP tags you may want to make sure that is working because I never test tag importing because my xml file didn't have any.

## the project ##
your main project folder is blog/, which means that you will be cd-ing between the main git project folder (WP-to-jekyll). Fear not, it is a good system, just remember to launch 'jekyll --server' from inside the blog directory.

I have a few pages set up for you