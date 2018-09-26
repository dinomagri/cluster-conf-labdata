#!/bin/bash

# Use this script in case of VM was suspended.
echo
echo "Checking for Date in elephant"
sudo service ntpd restart
echo -e "\e[32m"
sudo date
echo -e "\e[30m"

echo "Checking for Date in tiger"
sudo ssh tiger "sudo service ntpd restart"
echo -e "\e[32m"
sudo ssh tiger "date"
echo -e "\e[30m"

echo "Checking for Date in horse"
sudo ssh horse "sudo service ntpd restart"
echo -e "\e[32m"
sudo ssh horse "date"
echo -e "\e[30m"

echo "Checking for Date in monkey"
sudo ssh monkey "sudo service ntpd restart"
echo -e "\e[32m"
sudo ssh monkey "date"
echo -e "\e[30m"
