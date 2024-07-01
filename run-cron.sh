#!/bin/bash
clear

export PATH=/luna/run
# // Menjalankan Pungsi Dengan Crontab
########################################
### MEMASANG PUNGSI AUTO KE CRONTAB ###
########################################
echo " Memasang limit ssh ke crontab "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/crontab
sleep 1
echo " Memasang xp ke crontab "
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/30 * * * *  root /usr/local/sbin/xp" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/crontab
sleep 1
echo " Memasang Autokill ssh ke crontab "
echo "*/1 * * * *  root /luna/run/kill-ssh $iplimit" >>/etc/cron.d
sleep 1
clear
########################################
#### MEMASANG PUNGSI AUTO KE CRON.D ####
########################################
cat >/etc/cron.d/autobackup<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/50 * * * * root /usr/local/sbin/otwbackup
END
echo "\e[92;1m Memasang limit ssh ke cron.d \e[0m"
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/cron.d/limit-ssh
sleep 1
echo "\e[92;1m Memasang xp ke cron.d \e[0m"
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/1 * * * *  root /usr/local/sbin/xp" >>/etc/cron.d/xp
sleep 1
echo "\e[92;1m Memasang autokill ssh ke cron.d \e[0m"
echo "*/1 * * * *  root /luna/run/kill-ssh" >>/etc/cron.d/kill-ssh
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/cron.d/delexp
sleep 1
#echo " Memasang autolock xray ke cron.d "

#echo "*/1 * * * *  root /usr/local/sbin/lockedvme" >>/etc/cron.d/lockvm
#echo "*/1 * * * *  root /usr/local/sbin/lockedvle" >>/etc/cron.d/lockvl
#echo "*/1 * * * *  root /usr/local/sbin/lockedssr" >>/etc/cron.d/lockss
#echo "*/1 * * * *  root /usr/local/sbin/lockedtro" >>/etc/cron.d/locktr
#sleep 1
echo " Memasang autokill xray ke cron.d "
cat >/etc/cron.d/killVMESS<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/1 * * * * root /usr/local/sbin/killVM
END
cat >/etc/cron.d/killVLESS<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/1 * * * * root /usr/local/sbin/killVL
END
cat >/etc/cron.d/killTROJAN<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/1 * * * * root /usr/local/sbin/killTR
END
cat >/etc/cron.d/killSDWSK<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/1 * * * * root /usr/local/sbin/killSS
END

systemctl daemon-reload
sleep 2
clear
echo -e "\e[93;1mIzinkan Service \e[0m"
# // Mengizinkan Service
systemctl enable xray
systemctl enable nginx
systemctl enable udp-mini
systemctl enable limit-ssh
systemctl enable limit
systemctl enable cron
systemctl enable noobzvpns
echo -e "\e[93;1mJalankan Service \e[0m"
# // Menjalankan Service
systemctl restart xray
systemctl restart nginx
systemctl restart limit-ssh
systemctl restart udp-mini
systemctl restart cron
systemctl restart noobzvpns
clear
echo -e "\e[92;1m Succesfully installed All Service \e[0m"
sleep 2
clear
cd
