#!/bin/bash

USUARIO=root
CMD="sudo"

setUpFileSystemOnOneNode() {
  $1 "sudo mkdir -p /disk1/dfs/nn"
  $1 "sudo mkdir -p /disk2/dfs/nn"
  $1 "sudo mkdir -p /disk1/dfs/dn"
  $1 "sudo mkdir -p /disk2/dfs/dn"
  $1 "sudo mkdir -p /disk1/nodemgr/local"
  $1 "sudo mkdir -p /disk2/nodemgr/local"
  $1 "sudo chown -R hdfs:hadoop /disk1/dfs/nn"
  $1 "sudo chown -R hdfs:hadoop /disk2/dfs/nn"
  $1 "sudo chown -R hdfs:hadoop /disk1/dfs/dn"
  $1 "sudo chown -R hdfs:hadoop /disk2/dfs/dn"
  $1 "sudo chown -R yarn:yarn /disk1/nodemgr/local"
  $1 "sudo chown -R yarn:yarn /disk2/nodemgr/local"
}

setUpFileSystemOnRemoteNodes() {
  echo 
  echo "Setting up file system directories and permissions on tiger."
  echo 
  setUpFileSystemOnOneNode "$CMD ssh $USUARIO@tiger"
  sleep 3
  echo 
  echo "Setting up file system directories and permissions on horse."
  echo 
  setUpFileSystemOnOneNode "$CMD ssh $USUARIO@horse"
  sleep 3
  echo 
  echo "Setting up file system directories and permissions on monkey."
  echo 
  setUpFileSystemOnOneNode "$CMD ssh $USUARIO@monkey"
  sleep 3
}

MYHOST="`hostname`: "
# Avoid "sudo: cannot get working directory" errors by
# changing to a directory owned by the $USUARIO user
cd ~
echo 
echo $MYHOST "Running " $0"."
echo
setUpFileSystemOnRemoteNodes
echo 
echo $MYHOST $0 "done."
echo
