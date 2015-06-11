#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Installing chrony..."
echo "####################################################################################################"


sudo apt-get install chrony -y

sudo ntpdate 0.debian.pool.ntp.org
sudo sh -c "echo '1 5dpo5dpo' > /etc/chrony/chrony.keys" # set chrony password



echo ""
echo "####################################################################################################"
echo "##### Manual configure master /etc/chrony/chrony.conf"
echo "####################################################################################################"

echo "broadcast 20 subnet # ex: broadcast 20 172.16/12"
echo "server 0.debian.pool.ntp.org minpoll 5 maxpoll 7"
echo "server 1.debian.pool.ntp.org minpoll 5 maxpoll 7"
echo "server 2.debian.pool.ntp.org minpoll 5 maxpoll 7"
echo "allow subnet # allow clients subnet, ex allow 172.16/12"
echo "initstepslew 10 client1_ip client2_ip client3_ip # ex: initstepslew 10 172.16.13.47 10.42.0.33"
echo "makestep 1 10"
echo "local stratum 8 # change stratum from 10 to 8"



echo ""
echo "####################################################################################################"
echo "##### Manual configure clients /etc/chrony/chrony.conf"
echo "####################################################################################################"

echo "server master_ip minpoll 4 maxpoll 6 # Add master to top of servers list and comment other servers"
echo "allow master_ip"
echo "initstepslew 20 master_ip"
echo "makestep 1 10"



echo ""
echo "####################################################################################################"
echo "##### FAQ"
echo "####################################################################################################"


echo ""
echo "===> Restart chrony"
echo "sudo /etc/init.d/chrony restart"

echo ""
echo "===> Force chrony time update without slew"
echo "sudo chronyc -a makestep"

echo ""
echo "===> Force chrony time update without slew (older chrony versions)"
echo "sudo chronyc"
echo "password passwd_in_keys # passwd in /etc/chrony/chrony.keys"
echo "makestep"
echo "exit"

echo ""
echo "===> Check chrony synchronization status"
echo "chronyc tracking"

echo ""
echo "===> Check chrony clients in master server"
echo "chronyc clients"

echo ""
echo "===> Check chrony time sources"
echo "chronyc sources -v"
echo "chronyc sourcestats -v"


echo -e "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
