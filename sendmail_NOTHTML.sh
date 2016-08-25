#!/bin/bash
#i can send mail to your email
obj=`date +"%m%d"`"mycar"
cat /root/pycar/newurl |mailx -s $obj 你的邮箱地址
