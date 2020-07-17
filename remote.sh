 #!/bin/zsh

progname=$0

usage() {
  cat <<EOF
Usage: $progname remote_address local_volume_name
EOF
  exit 0
}

if [ $# -ne 2 ] ; then
    usage
else
    address=$1
    mount_name=$2
fi

volname="/Volumes/$mount_name"
sudo mkdir $volname
sudo sshfs -o local,allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa -o volname=$mount_name $1:/ $mount_name