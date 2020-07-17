 #!/bin/zsh

progname=$0

usage() {
  cat <<EOF
Usage: $progname [-c] remote_address local_volume_name
EOF
  exit 0
}

connect="n"
while getopts ":c:h?:" opt; do
  case $opt in
  c ) connect="y";shift 1 ;;
  h|\? ) usage >&2 ;;
  esac
done

if [ $# -lt 2 ]
then
    usage >&2
fi

remote_host=$1
volname=$2

mount_point="/Volumes/$volname"
sudo mkdir $mount_point 2> /dev/null
sudo sshfs -o local,allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa -o volname=$volname $remote_host:/ $mount_point

if [ "$connect" == "y" ]
then
    ssh $1
fi