#!/bin/bash

#APACHE
RESTART=" /etc/init.d/httpd restart"
PGREP="/usr/bin/pgrep"
HTTPD="apache"
$PGREP ${HTTPD}
if [ $? -ne 0]; then
        $RESTART
        echo "[$(date)] [Restarted Apache]" >> /root/Admin/logs/log-apache.txt
fi

#MYSQL
RESTARTM="/etc/rc.d/init.d/mysqld restart"
MYSQLD="mysqld"
$PGREP ${MYSQLD}
if [ $? -ne 0 ]; then
        $RESTART
        $RESTARTM
        echo "[$(date)] [Restarted MySQL with Apache]" >> /root/Admin/logs/dbrestarter.txt
fi
