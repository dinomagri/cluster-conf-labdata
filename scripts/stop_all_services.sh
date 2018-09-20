#!/bin/bash

USUARIO=root
CMD="sudo"

stop_elephant() {
	sudo service hadoop-hdfs-namenode stop
	sudo service hadoop-hdfs-datanode stop
	sudo service hadoop-yarn-nodemanager stop
	sudo service zookeeper-server stop
	sudo service hive-metastore stop
	sudo service hive-server2 stop
	sudo service hadoop-hdfs-datanode stop
	sudo service impala-server stop
	echo
	echo ">>>> All ELEPHANT services stoped."
	echo
	sleep 3
}

stop_tiger() {
	$CMD ssh root@tiger "service hadoop-hdfs-secondarynamenode stop"
	$CMD ssh root@tiger "service hadoop-hdfs-datanode stop"
	$CMD ssh root@tiger "service hadoop-yarn-nodemanager stop"
	$CMD ssh root@tiger "service zookeeper-server stop"
	$CMD ssh root@tiger "service hadoop-hdfs-datanode stop"
	$CMD ssh root@tiger "service impala-server stop"
	echo
	echo ">>>> All TIGER services stoped."
	echo
	sleep 3
}

stop_horse() {
	$CMD ssh root@horse "service hadoop-hdfs-datanode stop"
	$CMD ssh root@horse "service hadoop-yarn-resourcemanager stop"
	$CMD ssh root@horse "service hadoop-yarn-nodemanager stop"
	$CMD ssh root@horse "service zookeeper-server stop"
	$CMD ssh root@horse "service hadoop-hdfs-datanode stop"
	$CMD ssh root@horse "service impala-state-store stop"
	$CMD ssh root@horse "service impala-catalog stop"
	$CMD ssh root@horse "service impala-server stop"
	echo
	echo ">>>> All HORSE services stoped."
	echo
	sleep 3
}

stop_monkey() {
	$CMD ssh root@monkey "service hadoop-hdfs-datanode stop"
	$CMD ssh root@monkey "service hadoop-yarn-nodemanager stop"
	$CMD ssh root@monkey "service hadoop-mapreduce-historyserver stop"
	$CMD ssh root@monkey "service hadoop-hdfs-datanode stop"
	echo
	echo ">>>> All MONKEY services stoped."
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
stop_elephant
stop_tiger
stop_horse
stop_monkey
echo 
echo $MYHOST $0 "done."
echo