#!/usr/bin/env bash

#sync main jekyll project 
sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/jekyll/blog/_site/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/html/

#sync assets from kristeraxel.com/media
sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/kristeraxel.com/media/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/kristeraxel.com/media/

#We will try this one next. TRYING!
# sync assets from blog.kristeraxel.com/media
sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/wp-mirror/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/html/