#!/bin/bash

USUARIO=root
CMD="sudo"

elephant_to_other() {
	echo 
	echo ">>> ELEPHANT - Starting connectivity testing ..."
	echo 
	ping tiger -c 3
	ping horse -c 3
	ping monkey -c 3
	echo "... done!!!"
}

tiger_to_other() {
	echo
	echo ">>> TIGER - Starting connectivity testing ..."
	echo
	$CMD ssh $USUARIO@tiger "ping elephant -c 3"
	sleep 3
	$CMD ssh $USUARIO@tiger "ping horse -c 3"
	sleep 3
	$CMD ssh $USUARIO@tiger "ping monkey -c 3"
	sleep 3
	echo "... done!!!"
}

horse_to_other() {
	echo
	echo ">>> HORSE - Starting connectivity testing ..."
	echo
	$CMD ssh $USUARIO@horse "ping elephant -c 3"
	sleep 3
	$CMD ssh $USUARIO@horse "ping tiger -c 3"
	sleep 3
	$CMD ssh $USUARIO@horse "ping monkey -c 3"
	sleep 3
	echo "... done!!!"
}

monkey_to_other() {
	echo
	echo ">>> MONKEY - Starting connectivity testing ..."
	echo
	$CMD ssh $USUARIO@monkey "ping elephant -c 3"
	sleep 3
	$CMD ssh $USUARIO@monkey "ping tiger -c 3"
	sleep 3
	$CMD ssh $USUARIO@monkey "ping horse -c 3"
	sleep 3
	echo "... done!!!"
}

MYHOST="`hostname`: "
# Avoid "sudo: cannot get working directory" errors by
# changing to a directory owned by the $USUARIO user
cd ~
echo 
echo $MYHOST "Running " $0"."
echo
elephant_to_other
echo
tiger_to_other
echo
horse_to_other
echo
monkey_to_other
echo 
echo $MYHOST $0 "done."
echo