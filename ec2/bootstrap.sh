#!/bin/bash
yum install -y git
mkdir -p /home/ec2-user
git clone https://${GITHUB_TOKEN}@github.com/reed9999/build-various-things.git /home/ec2-user/scripts
# git clone  https://github.com/reed9999/build-various-things.git /home/ec2-user/scripts
# I don't think any of this will apply because user_data initialization runs as root
	pushd /home/ec2-user/scripts
		# Any git repo dir will do; set some global config.
		git config pull.rebase false
		git config --global user.name "Philip J. Reed" 
		git config --global user.email reed9999@uw.edu
		git config --global core.autocrlf input
		git config --global credential.helper store  # be careful! stores in plaintext

	popd

cp /home/ec2-user/scripts/misc/.vimrc /home/ec2-user
chown -R ec2-user /home/ec2-user/*
