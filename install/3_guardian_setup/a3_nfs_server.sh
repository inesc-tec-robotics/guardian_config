#!/usr/bin/env sh

user_name=${1:-"$USER"}

echo "####################################################################################################"
echo "##### Setting up NFS server (https://help.ubuntu.com/community/SettingUpNFSHowTo)"
echo "####################################################################################################"

sudo apt-get install nfs-kernel-server -y

sudo sh -c "echo '/home/${user_name} 192.168.0.0/255.255.0.0(rw,sync,no_subtree_check) 172.16.0.0/255.240.0.0(rw,sync,no_subtree_check) 10.0.0.0/255.0.0.0(rw,sync,no_subtree_check)' >> /etc/exports"

sudo exportfs -ra
sudo service portmap restart
sudo service nfs-kernel-server restart


echo "\n\n"
echo "--------------------------------------------------------------------"
echo "--- To mount the NFS share:"
echo "sudo apt-get install nfs-common -y"
echo "sudo mkdir -p /home/${user_name}" 
echo "sudo mount -t nfs nfs_server_ip:/home/${user_name} /home/${user_name}"

echo "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
