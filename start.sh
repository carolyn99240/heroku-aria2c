#!/bin/bash

if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
	echo "Rclone config detected"
	echo -e "[DRIVE]\n$RCLONE_CONFIG" > rclone.conf
	echo "on-download-complete=./on-complete.sh" >> aria2c.conf
	chmod +x on-complete.sh
fi

echo "rpc-secret=1XXZ4soQ3Zb1XhXv6Uvl5OP8nnG_K7kmVatoMSy63vgua4sC" >> aria2c.conf
aria2c --conf-path=aria2c.conf&
yarn start
