#! /usr/bin/expect
spawn  /usr/local/sbin/kamdbctl presence;
expect "MySQL password for root: ";
send "passwd\r";
expect "END";
