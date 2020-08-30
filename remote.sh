 #!/bin/zsh

progname=$0

usage() {
  cat <<EOF
Usage: $progname [-c] [-r] remote_address local_volume_name
EOF
  exit 0
}

connect="n"
root="n"

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
OPTIND=1
while getopts "crh?:" opt; do
  case $opt in
  c ) connect="y" ;;
  r ) root="y" ;;
  h|\? ) usage >&2 ;;
  esac
done
shift $((OPTIND-1))
#echo "Connect: $connect"
#echo "Root: $root"

if [ $# -lt 2 ]
then
    usage >&2
fi

remote_host=$1
volname=$2

mount_point="/Volumes/$volname"
sudo umount $mount_point 2> /dev/null
sudo mkdir -p $mount_point 2> /dev/null

perm="$USER:staff"
sudo chown $perm $mount_point

remote_user=$(echo $USER | sed 's/:.*//')
# Exploring SUDO privilages for the logged in user, but not able to get working between Mac and Ubuntu
# -o sftp_server="/usr/bin/sudo -u ragu /usr/lib/openssh/sftp-server" 
sshfs -o local,allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa -o volname=$volname $remote_host:/home/$remote_user $mount_point

if [ "$root" == "y" ]
then
    rootname="Root"
    volname_root="$volname\_$rootname"
    
    ip_addr=$(echo $remote_host | sed 's/.*@//')
    remote_host_root="root@$ip_addr"
    
    mount_point_root="$mount_point"+"_"+"$rootname"
    sudo umount $mount_point_root 2> /dev/null
    sudo mkdir -p $mount_point_root 2> /dev/null
    
    sudo sshfs -o local,allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa -o volname=$volname_root $remote_host_root:/ $mount_point_root
fi

if [ "$connect" == "y" ]
then
    ssh $remote_host
fi