#!/bin/bash

USUARIO=root
CMD="sudo"

shutdown_hosts() {
  $CMD ssh $USUARIO@tiger "sudo halt"
  sleep 2
  echo "Tiger is down :("
  $CMD ssh $USUARIO@horse "sudo halt"
  sleep 2
  echo "Horse is down :("
  $CMD ssh $USUARIO@monkey "sudo halt"
  sleep 2
  echo "Monkey is down :("
  echo "Elephant is going down ..."
  sleep 5
  sudo init 0
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