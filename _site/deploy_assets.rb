#!/usr/bin/env bash

#sync separate assets from somehwere else assets from kristeraxel.com/media
sudo rsync --delete --stats -tiprogl --progress /FULLPATH_TO_YOUR_ASSETS/ -e "ssh -i /FULLPATH_TO_YOUR_EC2_KEY/Yourkey.pem" ec2-user@YOUR_IP:/var/SOMEWHERE_ELSE/
