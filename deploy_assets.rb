#!/usr/bin/env bash

#sync assets from kristeraxel.com/media
sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/kristeraxel.com/media/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/kristeraxel.com/media/

# sync assets from blog.kristeraxel.com/media
sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/kristeraxel.com/wp-mirror/wp-content/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/html/wp-content/