#!/bin/bash
#set htpasswdpath [lindex $argv 0]
set username [lindex $argv 0]
set userpass [lindex $argv 1]

# spawn the htpasswd command process
spawn htpasswd -c $username
# Automate the 'New password' Procedure
expect "New password:"
send "$userpass\r"
expect "Re-type new password:"
send "$userpass\r"
expect eof
