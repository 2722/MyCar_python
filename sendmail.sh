#!/bin/bash
#i can send mail to your email

obj=`date +"%m%d"`"mycar"

echo 'From: pycar' > mailbody
echo 'To: [!YOURNAME] <[!YOURMAILADDRESS]>' >> mailbody
# echo 'Cc: someone <someone@example.com>,TooYoung <toosimple@naive.com>' >> mailbody
echo -e 'Subject: '$obj'\nContent-Type: text/html\n' >> mailbody

cat /root/pycar/newurl | grep -v ^$ | while read oneline
do
    echo -e '<p><video controls><source src="'$oneline'" type="video/mp4"><a href="'$oneline'">'$oneline'</a></video></p>\n' >> mailbody
done

sendmail -t < mailbody
