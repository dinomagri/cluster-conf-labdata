#!/bin/bash

CMD="sudo"

copyConfigFiles() {
  $CMD scp /etc/hadoop/conf/core-site.xml root@tiger:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/core-site.xml root@horse:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/core-site.xml root@monkey:/etc/hadoop/conf/
  echo "Done copying core-site.xml to tiger, horse, monkey"
  sleep 3
  
  $CMD scp /etc/hadoop/conf/hdfs-site.xml root@tiger:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/hdfs-site.xml root@horse:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/hdfs-site.xml root@monkey:/etc/hadoop/conf/
  echo "Done copying hdfs-site.xml to tiger, horse, monkey"
  sleep 3

  $CMD scp /etc/hadoop/conf/yarn-site.xml root@tiger:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/yarn-site.xml root@horse:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/yarn-site.xml root@monkey:/etc/hadoop/conf/
  echo "Done copying yarn-site.xml to tiger, horse, monkey"
  sleep 3
  
  $CMD scp /etc/hadoop/conf/mapred-site.xml root@tiger:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/mapred-site.xml root@horse:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/mapred-site.xml root@monkey:/etc/hadoop/conf/
  echo "Done copying mapred-site.xml to tiger, horse, monkey"
  sleep 3

  $CMD scp /etc/hadoop/conf/hadoop-env.sh root@tiger:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/hadoop-env.sh root@horse:/etc/hadoop/conf/
  $CMD scp /etc/hadoop/conf/hadoop-env.sh root@monkey:/etc/hadoop/conf/
  echo "Done copying hadoop-env.sh to tiger, horse, monkey"
  sleep 3
}

MYHOST="`hostname`: "
echo
echo $MYHOST "Running " $0"."
echo
copyConfigFiles
echo $MYHOST $0 "done."
echo
