#!/bin/bash
#i can send mail to your email

export PATH=/usr/sbin:/usr/bin:$PATH
obj=`date +"%m%d"`"mycar"

echo 'From: pycar' > mailbody
echo 'To: [!YOURNAME] <[!YOURMAILADDRESS]>' >> mailbody
# echo 'Cc: someone <someone@example.com>, TooYoung <toosimple@naive.com>' >> mailbody
echo -e 'Subject: '$obj'\nContent-Type: text/html\n' >> mailbody

cat /root/pycar/newurl | grep -v ^$|sed '/Now URL/d'| while read oneline
do
    echo -e '<p ><video style="width:540px;height:304px" controls><source src="'$oneline'" type="video/mp4"><a href="'$oneline'">'$oneline'</a></video></p>\n' >> mailbody
done

/usr/sbin/sendmail -t < mailbody
rm -f mailbody