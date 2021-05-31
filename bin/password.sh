#!/bin/bash

echo Path to file:
read PATH_TO_FILE

echo Account:
read account

decryption=$(ccrypt -c $PATH_TO_FILE | grep $account)
login=$(echo $decryption | cut -d " " -f 2)
password=$(echo $decryption | cut -d " " -f 3)

echo Your login details are: $login $password