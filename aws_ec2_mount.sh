#!/bin/zsh

identity_file=/Users/ragu/.ssh/pdx-aman-keypair.pem
remote_host=ec2-3-23-113-91.us-east-2.compute.amazonaws.com
remote_user=ec2-user

volname=EC2

mount_point="/Volumes/$volname"
sudo umount $mount_point 2> /dev/null
sudo mkdir -p $mount_point 2> /dev/null

perm="$USER:staff"
sudo chown $perm $mount_point

sshfs -o local,allow_other,defer_permissions,IdentityFile=$identity_file -o volname=$volname $remote_user@$remote_host:/home/$remote_user $mount_point