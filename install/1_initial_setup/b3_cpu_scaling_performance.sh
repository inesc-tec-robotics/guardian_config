#!/usr/bin/env sh

echo "####################################################################################################"
echo "##### Setting CPU governor to performance"
echo "####################################################################################################"

sudo apt-get install cpufrequtils -y
sudo sh -c 'echo GOVERNOR="performance" > /etc/default/cpufrequtils'
sudo update-rc.d ondemand disable
sudo /etc/init.d/cpufrequtils restart


echo "\n\n"
echo "===================================================================================================="
echo "===== cpufreq-info"

cpufreq-info


echo "\n\n"
echo "####################################################################################################"
echo "##### Finished"
echo "####################################################################################################"
