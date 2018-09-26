#!/bin/bash

USUARIO=root
CMD="sudo"

shutdown_hosts() {
  $CMD ssh $USUARIO@tiger "sudo shutdown -h now"
  sleep 2
  echo "Tiger is down :("
  $CMD ssh $USUARIO@horse "sudo shutdown -h now"
  sleep 2
  echo "Horse is down :("
  $CMD ssh $USUARIO@monkey "sudo shutdown -h now"
  sleep 2
  echo "Monkey is down :("
  echo "Elephant is going down ..."
  sleep 5
  sudo shutdown -h now
}


MYHOST="`hostname`: "
# Avoid "sudo: cannot get working directory" errors by
# changing to a directory owned by the $USUARIO user
cd ~
echo 
echo $MYHOST "Running " $0"."
echo
shutdown_hosts
echo 
echo $MYHOST $0 "done."
echo