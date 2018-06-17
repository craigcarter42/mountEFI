#!/bin/bash

# Confirms if the script is being run as sudo
if [ "$EUID" -ne 0 ]
  then echo 'mountEFI: Please run as sudo'
  exit
fi

echo ' ;)'
echo 'mountEFI: Start'

# Check if EFI directory has been made.
if [ -e /Volumes/efi ]; then
	echo 'mountEFI: EFI Volume exists'
	echo 'mountEFI: End'
	exit
else
	mkdir /Volumes/efi
	if [ -e /Volumes/efi ]; then
		echo 'mountEFI: EFI Volume created'
	fi
fi

# Attempts to mount the EFI Volume.
mount -t msdos /dev/disk0s1 /Volumes/efi
echo 'mountEFI: Mounting "disk0s1" as EFI Volume'
echo 'mountEFI: End'
