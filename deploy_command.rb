#!/usr/bin/env bash

#sync main jekyll project 
sudo rsync --stats -tiprogl --progress /FULLPATH_TO_THIS_PROJECT/blog/_site/ -e "ssh -i FULLPATH_TO_YOUR_EC2_KEY/Yourkey.pem" ec2-user@YOURIP:/var/www/html/

