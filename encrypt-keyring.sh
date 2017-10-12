#!/bin/bash

echo "Please specify the path to the GPG keyring file or leave it empty to use the default."
echo -n "Keyring file path (~/.gnupg/secring.gpg): "
read -s keyring
echo

if [ -z "$keyring" ]; then
    echo "Using default GPG keyring from ~/.gnupg/secring.gpg."
    keyring=~/.gnupg/secring.gpg
fi

if [ ! -f $keyring ]; then
    echo "The keyring file was not found! Exiting."
    exit 1
fi
echo
echo -n Please enter the password to encrypt the signing key:
read -s password1
echo
echo -n Retype the password:
read -s password2
echo
echo

if [ "$password1" != "$password2" ]; then
  echo "The entered passwords are not equal. Exiting."
  exit 1
fi

export envKeyringPassword=$password1
openssl aes-256-cbc -e -pass "env:envKeyringPassword" -in $keyring -out ./etc/sign.enc

if [ "$1" == "-d" ]; then
  echo "Printing out the MD5 sums of the processes files:"
  md5sum $keyring
  md5sum ./etc/sign.enc
fi



echo
echo "Use the following environment variable in the build options on Travis CI."
printf -v escapedPwd "%q" "$password1"
echo "envKeyringPassword=$escapedPwd"
echo "Make sure you disabled the option 'Display value in build log'!"

