#! /usr/bin/expect
spawn  /usr/local/sbin/kamdbctl create;
expect "MySQL password for root: ";
send "passwd\r";
expect "END";
