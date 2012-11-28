#!/usr/bin/env bash

sudo rsync --delete --stats -tiprogl --progress /Users/theta/src/jekyll/blog/_site/ -e "ssh -i /Users/theta/src/aws/key/BlogKAkey.pem" ec2-user@107.22.165.75:/var/www/html/