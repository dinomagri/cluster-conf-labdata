#!/bin/bash

USUARIO=root
CMD="sudo"

restart_elephant() {
	sudo service hadoop-hdfs-namenode restart
	sudo service hadoop-hdfs-datanode restart
	sudo service hadoop-yarn-nodemanager restart
	sudo service zookeeper-server restart
	sudo service hive-metastore restart
	sudo service hive-server2 restart
	sudo service hadoop-hdfs-datanode restart
	sudo service impala-server restart
	echo
	echo ">>>> All ELEPHANT services restarted."
	echo
	sleep 3
}

restart_tiger() {
	$CMD ssh root@tiger "service hadoop-hdfs-secondarynamenode restart"
	$CMD ssh root@tiger "service hadoop-hdfs-datanode restart"
	$CMD ssh root@tiger "service hadoop-yarn-nodemanager restart"
	$CMD ssh root@tiger "service zookeeper-server restart"
	$CMD ssh root@tiger "service hadoop-hdfs-datanode restart"
	$CMD ssh root@tiger "service impala-server restart"
	echo
	echo ">>>> All TIGER services restarted."
	echo
	sleep 3
}

restart_horse() {
	$CMD ssh root@horse "service hadoop-hdfs-datanode restart"
	$CMD ssh root@horse "service hadoop-yarn-resourcemanager restart"
	$CMD ssh root@horse "service hadoop-yarn-nodemanager restart"
	$CMD ssh root@horse "service zookeeper-server restart"
	$CMD ssh root@horse "service hadoop-hdfs-datanode restart"
	$CMD ssh root@horse "service impala-state-store restart"
	$CMD ssh root@horse "service impala-catalog restart"
	$CMD ssh root@horse "service impala-server restart"
	echo
	echo ">>>> All HORSE services restarted."
	echo
	sleep 3
}

restart_monkey() {
	$CMD ssh root@monkey "service hadoop-hdfs-datanode restart"
	$CMD ssh root@monkey "service hadoop-yarn-nodemanager restart"
	$CMD ssh root@monkey "service hadoop-mapreduce-historyserver restart"
	$CMD ssh root@monkey "service hadoop-hdfs-datanode restart"
	echo
	echo ">>>> All MONKEY services restarted."
	echo
	sleep 3
}



MYHOST="`hostname`: "
# Avoid "sudo: cannot get working directory" errors by
# changing to a directory owned by the $USUARIO user
cd ~
echo 
echo $MYHOST "Running " $0"."
echo
restart_elephant
restart_tiger
restart_horse
restart_monkey
echo 
echo $MYHOST $0 "done."
echo